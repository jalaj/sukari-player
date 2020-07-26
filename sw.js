var cacheListz = [
"/bg.jpg",
"/favicon.ico",
"/gspzls.js",
"/hammer.min.js",
"/hit1.JPG",
"/hit2.JPG",
"/hitb.JPG",
"/hit2.png",
"/hitb.png",
"/hlight.pde",
"/home.html",
"/jquery-3.4.1.min.js",
"/manifest.json",
"/ms-icon-144x144.png",
"/mtrail.pde",
"/processing.min.js",
"/puzzled.jpg",
"/pzbase.pde",
"/pzgrid.pde",
"https://unpkg.com/onsenui@2.10.10/js/onsenui.min.js",
"https://unpkg.com/onsenui@2.10.10/css/font_awesome/css/all.min.css",
"https://unpkg.com/onsenui@2.10.10/css/font_awesome/css/v4-shims.min.css",
"https://unpkg.com/onsenui@2.10.10/css/font_awesome/webfonts/fa-brands-400.woff2",
"https://unpkg.com/onsenui@2.10.10/css/font_awesome/webfonts/fa-solid-900.woff2",
"https://unpkg.com/onsenui@2.10.10/css/ionicons/css/ionicons.min.css",
"https://unpkg.com/onsenui@2.10.10/css/material-design-iconic-font/css/material-design-iconic-font.min.css",
"https://unpkg.com/onsenui@2.10.10/css/onsen-css-components.min.css",
"https://unpkg.com/onsenui@2.10.10/css/onsenui.css"
];
var cacheList = [
"/bg.jpg"
];

// 1. Save the files to the user's device
// The "install" event is called when the ServiceWorker starts up.
// All ServiceWorker code must be inside events.
self.addEventListener('install', function(e) {
  console.log('install');

  // waitUntil tells the browser that the install event is not finished until we have
  // cached all of our files
  e.waitUntil(
    // Here we call our cache "myonsenuipwa", but you can name it anything unique
    caches.open('sukari').then(cache => {
      // If the request for any of these resources fails, _none_ of the resources will be
      // added to the cache.
      return cache.addAll(cacheList);
    })
  );
});

// 2. Intercept requests and return the cached version instead
self.addEventListener('fetch', function(e) {
  e.respondWith(
    // check if this file exists in the cache
    caches.match(e.request)
      // Return the cached file, or else try to get it from the server
      .then(response => response || fetch(e.request))
  );
});
