var map;

map = null;

(function() {
  $(function() {
    var circle, onCircleClick;
    map = L.map('mapid').setView([51.505, -0.09], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    circle = L.circle([51.508, -0.11], {
      color: 'red',
      fillColor: '#f03',
      fillOpacity: 0.5,
      radius: 500
    }).addTo(map);
    onCircleClick = function(e) {
      return M.toast({
        html: 'You click on circle'
      });
    };
    return circle.on('click', onCircleClick);
  });
}).call(this);
