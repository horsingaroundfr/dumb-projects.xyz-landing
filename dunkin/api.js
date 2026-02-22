/**
 * DonutSMP Full API Proxy — Vercel Edge Function
 * Save as: /api/index.js  (or /dunkin/api.js if your folder is /dunkin)
 *
 * ══════════════════════════════════════════════
 *  ROUTES  (all GET unless noted)
 * ══════════════════════════════════════════════
 *
 *  PLAYER
 *    ?user=USERNAME          → lookup + stats combined
 *    ?stats=USERNAME         → /v1/stats/{user}
 *    ?lookup=USERNAME        → /v1/lookup/{user}
 *
 *  LEADERBOARDS
 *    ?lb=kills               → /v1/leaderboards/kills/1
 *    ?lb=deaths
 *    ?lb=money
 *    ?lb=shards
 *    ?lb=playtime
 *    ?lb=brokenblocks
 *    ?lb=placedblocks
 *    ?lb=mobskilled
 *    ?lb=sell
 *    ?lb=shop
 *    &page=N                 → optional page param (default 1)
 *
 *  AUCTION
 *    ?auction                → /v1/auction/list/1  (all listings)
 *    ?auction&search=sword   → /v1/auction/list/1  (search)
 *    ?auction&sort=lowest_price|highest_price|recently_listed|last_listed
 *    ?auction&page=N         → paginate
 *    ?transactions           → /v1/auction/transactions/1
 *    ?transactions&page=N    → paginate (max 10)
 *
 *  SHIELD  (server infra — requires your key to have shield perms)
 *    ?shield=SERVICE_ID&type=metrics          → /v1/shield/metrics/{service}
 *    ?shield=SERVICE_ID&type=stats            → /v1/shield/stats/{service}
 *    ?shield=SERVICE_ID&type=java-config      → /v1/shield/java/config/{service}
 *    ?shield=SERVICE_ID&type=bedrock-config   → /v1/shield/bedrock/config/{service}
 *
 *  EVERYTHING
 *    ?user=USERNAME&full=1   → all player data + all leaderboard ranks + their AH history
 *
 * ══════════════════════════════════════════════
 */

export const config = { runtime: "edge" };

const API_KEY  = "YOUR_API_KEY_HERE"; // <-- swap this
const BASE_URL = "https://api.donutsmp.net";

const LEADERBOARD_CATS = [
  "kills", "deaths", "money", "shards", "playtime",
  "brokenblocks", "placedblocks", "mobskilled", "sell", "shop",
];

const VALID_LB_CATS = new Set(LEADERBOARD_CATS);

const VALID_SORTS = new Set([
  "lowest_price", "highest_price", "recently_listed", "last_listed",
]);

export default async function handler(request) {
  const url    = new URL(request.url);
  const params = url.searchParams;

  const h = {
    Authorization: `Bearer ${API_KEY}`,
    "Content-Type": "application/json",
  };

  // ── ?stats=USERNAME ──────────────────────────────────────────────────────
  if (params.has("stats") && !params.has("user")) {
    const user = params.get("stats");
    if (!user) return json({ error: "stats param requires a username" }, 400);
    const res = await fetch(`${BASE_URL}/v1/stats/${enc(user)}`, { headers: h });
    return proxy(res);
  }

  // ── ?lookup=USERNAME ─────────────────────────────────────────────────────
  if (params.has("lookup")) {
    const user = params.get("lookup");
    if (!user) return json({ error: "lookup param requires a username" }, 400);
    const res = await fetch(`${BASE_URL}/v1/lookup/${enc(user)}`, { headers: h });
    return proxy(res);
  }

  // ── ?lb=CATEGORY ─────────────────────────────────────────────────────────
  if (params.has("lb")) {
    const cat  = params.get("lb");
    const page = parseInt(params.get("page") ?? "1", 10) || 1;
    if (!VALID_LB_CATS.has(cat)) {
      return json({
        error: `Invalid leaderboard. Valid options: ${LEADERBOARD_CATS.join(", ")}`,
      }, 400);
    }
    const res = await fetch(`${BASE_URL}/v1/leaderboards/${cat}/${page}`, { headers: h });
    return proxy(res);
  }

  // ── ?auction ─────────────────────────────────────────────────────────────
  if (params.has("auction")) {
    const page   = parseInt(params.get("page") ?? "1", 10) || 1;
    const search = params.get("search") ?? undefined;
    const sort   = params.get("sort")   ?? undefined;

    if (sort && !VALID_SORTS.has(sort)) {
      return json({
        error: `Invalid sort. Valid options: ${[...VALID_SORTS].join(", ")}`,
      }, 400);
    }

    const body = {};
    if (search) body.search = search;
    if (sort)   body.sort   = sort;

    const res = await fetch(`${BASE_URL}/v1/auction/list/${page}`, {
      headers: h,
      ...(Object.keys(body).length ? { body: JSON.stringify(body) } : {}),
    });
    return proxy(res);
  }

  // ── ?transactions ────────────────────────────────────────────────────────
  if (params.has("transactions")) {
    const page = Math.min(10, Math.max(1, parseInt(params.get("page") ?? "1", 10) || 1));
    const res  = await fetch(`${BASE_URL}/v1/auction/transactions/${page}`, { headers: h });
    return proxy(res);
  }

  // ── ?shield=SERVICE_ID&type=... ──────────────────────────────────────────
  if (params.has("shield")) {
    const service = params.get("shield");
    const type    = params.get("type") ?? "metrics";

    if (!service) return json({ error: "shield param requires a service ID" }, 400);

    const shieldRoutes = {
      "metrics":        `/v1/shield/metrics/${enc(service)}`,
      "stats":          `/v1/shield/stats/${enc(service)}`,
      "java-config":    `/v1/shield/java/config/${enc(service)}`,
      "bedrock-config": `/v1/shield/bedrock/config/${enc(service)}`,
    };

    const route = shieldRoutes[type];
    if (!route) {
      return json({
        error: `Invalid shield type. Valid options: ${Object.keys(shieldRoutes).join(", ")}`,
      }, 400);
    }

    const res = await fetch(`${BASE_URL}${route}`, { headers: h });
    return proxy(res);
  }

  // ── ?user=USERNAME  (lookup + stats, optional full=1 for everything) ──────
  if (params.has("user")) {
    const user = params.get("user");
    const full = params.get("full") === "1";

    if (!user) return json({ error: "user param requires a username" }, 400);

    if (!full) {
      // Just lookup + stats
      const [statsRes, lookupRes] = await Promise.all([
        fetch(`${BASE_URL}/v1/stats/${enc(user)}`,  { headers: h }),
        fetch(`${BASE_URL}/v1/lookup/${enc(user)}`, { headers: h }),
      ]);
      const [stats, lookup] = await Promise.all([
        safeJsonRes(statsRes),
        safeJsonRes(lookupRes),
      ]);
      return json({
        user,
        fetched_at: new Date().toISOString(),
        profile: lookup?.result ?? null,
        stats:   stats?.result  ?? null,
      });
    }

    // full=1 — everything: lookup, stats, all leaderboards, all AH transactions
    const [
      statsRes,
      lookupRes,
      auctionSearchRes,
      ...rest
    ] = await Promise.allSettled([
      fetch(`${BASE_URL}/v1/stats/${enc(user)}`,  { headers: h }),
      fetch(`${BASE_URL}/v1/lookup/${enc(user)}`, { headers: h }),
      fetch(`${BASE_URL}/v1/auction/list/1`, {
        headers: h,
        body: JSON.stringify({ search: user }),
      }),
      ...LEADERBOARD_CATS.map((cat) =>
        fetch(`${BASE_URL}/v1/leaderboards/${cat}/1`, { headers: h })
          .then((r) => r.json())
          .then((data) => ({ type: "lb", cat, data }))
          .catch(() => ({ type: "lb", cat, data: null }))
      ),
      ...Array.from({ length: 10 }, (_, i) =>
        fetch(`${BASE_URL}/v1/auction/transactions/${i + 1}`, { headers: h })
          .then((r) => r.json())
          .then((data) => ({ type: "tx", page: i + 1, data }))
          .catch(() => ({ type: "tx", page: i + 1, data: null }))
      ),
    ]);

    const stats  = await safeJson(statsRes);
    const lookup = await safeJson(lookupRes);

    const auctionListRaw = await safeJson(auctionSearchRes);
    const active_auction_listings = auctionListRaw?.result
      ? auctionListRaw.result.filter(
          (e) => e.seller?.name?.toLowerCase() === user.toLowerCase()
        )
      : [];

    const lbSettled = rest.slice(0, LEADERBOARD_CATS.length);
    const txSettled = rest.slice(LEADERBOARD_CATS.length);

    const leaderboard_positions = {};
    for (const settled of lbSettled) {
      if (settled.status !== "fulfilled") continue;
      const { cat, data } = settled.value;
      if (!data?.result) { leaderboard_positions[cat] = { rank: null, value: null }; continue; }
      const idx = data.result.findIndex(
        (e) => e.username?.toLowerCase() === user.toLowerCase()
      );
      leaderboard_positions[cat] =
        idx !== -1
          ? { rank: idx + 1, value: data.result[idx].value }
          : { rank: null, value: null, note: "not in top page" };
    }

    const auction_transaction_history = [];
    for (const settled of txSettled) {
      if (settled.status !== "fulfilled") continue;
      const { data } = settled.value;
      if (!data?.result) continue;
      auction_transaction_history.push(
        ...data.result.filter(
          (e) => e.seller?.name?.toLowerCase() === user.toLowerCase()
        )
      );
    }
    auction_transaction_history.sort(
      (a, b) => (b.unixMillisDateSold ?? 0) - (a.unixMillisDateSold ?? 0)
    );

    return json({
      user,
      fetched_at: new Date().toISOString(),
      profile:  lookup?.result ?? null,
      stats:    stats?.result  ?? null,
      active_auction_listings,
      auction_transaction_history,
      auction_transaction_count: auction_transaction_history.length,
      leaderboard_positions,
    });
  }

  // ── No matching route ────────────────────────────────────────────────────
  return json({
    error: "No valid query param provided.",
    routes: {
      "?user=USERNAME":                  "lookup + stats",
      "?user=USERNAME&full=1":           "EVERYTHING for this player",
      "?stats=USERNAME":                 "stats only",
      "?lookup=USERNAME":                "lookup only",
      "?lb=CATEGORY&page=N":             `leaderboard. categories: ${LEADERBOARD_CATS.join(", ")}`,
      "?auction":                        "auction house listings",
      "?auction&search=QUERY":           "search auction house",
      "?auction&sort=lowest_price":      "sorted auction house",
      "?auction&page=N":                 "paginate auction house",
      "?transactions&page=N":            "auction transaction history (max page 10)",
      "?shield=SERVICE_ID&type=metrics": "shield metrics",
      "?shield=SERVICE_ID&type=stats":   "shield stats",
      "?shield=SERVICE_ID&type=java-config":    "shield java config",
      "?shield=SERVICE_ID&type=bedrock-config": "shield bedrock config",
    },
  }, 400);
}

// ── Helpers ────────────────────────────────────────────────────────────────

function enc(s) { return encodeURIComponent(s); }

// proxy raw upstream response
async function proxy(res) {
  const body = await res.text();
  return new Response(body, {
    status: res.status,
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  });
}

async function safeJsonRes(res) {
  if (!res.ok) return null;
  try { return await res.json(); } catch { return null; }
}

async function safeJson(settled) {
  if (settled.status !== "fulfilled" || !settled.value.ok) return null;
  try { return await settled.value.json(); } catch { return null; }
}

function json(data, status = 200) {
  return new Response(JSON.stringify(data, null, 2), {
    status,
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  });
}
