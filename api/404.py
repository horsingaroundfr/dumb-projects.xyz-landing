def handleRequest(request):
    return __new__(Response('node running on port 8080!', {
        'headers' : { 'content-type' : 'text/plain' }
    }))

addEventListener('fetch', (lambda event: event.respondWith(handleRequest(event.request))))
