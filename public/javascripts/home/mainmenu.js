var map;

map = null;

(function() {
  $(function() {
    var circle, onCircleClick;
    map = L.map('mapid').setView([31.3193561718426, 121.34392735101], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    circle = L.circle([31.3193561718426, 121.34392735101], {
      color: 'red',
      fillColor: '#f03',
      fillOpacity: 0.5,
      radius: 500
    }).addTo(map);
    onCircleClick = function(e) {
      M.toast({
        html: 'You click on circle'
      });
      return $.ajax({
        url: "/home/fetchflat"
      }).done(function(html) {});
    };
    return circle.on('click', onCircleClick);
  });
}).call(this);
