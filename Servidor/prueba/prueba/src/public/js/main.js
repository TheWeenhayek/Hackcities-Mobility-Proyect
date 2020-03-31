var map = L.map('map-template').setView([51.505, -0.09], 3);

const tileURL = 'https://b.tile.openstreetmap.org/{z}/{x}/{y}.png' 
const tileURL2 = 'https://maps.wikimedia.org/osm-intl/{z}/{x}/{y}.png';

const tile = L.tileLayer(tileURL2);






// Socket Io
const socket = io.connect();

// Marker
const marker = L.marker([-16.65, -68.29]); //
marker.bindPopup('Hello There!');
map.addLayer(marker);

//Geolocation
map.locate({enableHighAccuracy: true})
map.on('locationfound', (e) => {
  const coords = [e.latlng.lat, e.latlng.lng];
  const newMarker = L.marker(coords);
  newMarker.bindPopup('You are Here!');
  map.addLayer(newMarker);
  socket.emit('userCoordinates', e.latlng);
});

// leer corr base de datos
  // Create a reference to the cities collection
/*let citiesRef = db.collection('contacts');

  // Create a query against the collection
let latitud = citiesRef.where('latitud', '==', true).get();
let longitud = citiesRef.where('longitud', '==', true).get();

const coords = [latitud, longitud];
console.log(coords);*/

// socket new User connected
socket.on('newUserCoordinates', (coords) => {
  console.log(coords);
  const userIcon = L.icon({
    iconUrl: '/img/icon2.png',
    iconSize: [38, 42],
  })
  const newUserMarker = L.marker([coords.lat, coords.lng], {
    icon: userIcon 
  });
  newUserMarker.bindPopup('New User!');
  map.addLayer(newUserMarker);
}); 

map.addLayer(tile);

