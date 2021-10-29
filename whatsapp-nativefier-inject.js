console.info("Checking for service worker in navigator...");
if ("serviceWorker" in navigator) {
    console.info("Service worker found in navigator.");

    console.info("Checking cache names from service worker...");
    caches.keys().then(function (cacheNames) {
        console.info("CacheNames:", cacheNames);
        cacheNames.forEach(function (cacheName) {
            console.info("Deleting cache", cacheName, "...");
            caches.delete(cacheName).then(function (result) {
                console.info("Cache", cacheName, "deleted:", result);
            });
        });
    });

    console.info("Checking service worker registrations...");
    navigator.serviceWorker.getRegistrations().then(function(registrations) {
        console.info("Registrations:", registrations);
        registrations.forEach(function (registration) {
            console.info("Unregistering registration", registration, "...");
            registration.unregister().then(function(result) {
                console.info("Registration", registration, "unregistered:", result);
            });
        });
    });
} else {
    console.info("Service worker not found in navigator.");
}
