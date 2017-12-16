var map;

map = null;

(function() {
  $(function() {
    var circle, onCircleClick;
    map = L.map('mapid').setView([31.3193561718426, 121.34392735101], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    $.ajax("/fetcharea").done(function(json) {
      return json.forEach(function(element, i) {
        var onRectangleClick, rectangle;
        rectangle = L.rectangle([[element[1], element[0]], [element[1] + 0.005, element[0] + 0.005]], {
          color: "red",
          weight: 0.7
        }).addTo(map);
        onRectangleClick = function(e) {
          M.toast({
            html: 'You click on rectange'
          });
          return $.ajax({
            url: "/gather/" + element[1] * 1000 + "/" + element[0] * 1000
          }).done(function(html) {
            return html.forEach(function(versa, i) {
              return $("#mylist").append('<li>' + '<div class="collapsible-header">' + '<div class="left">Appartement ' + i + '&nbsp;&nbsp;&nbsp;' + '</div><div class="right">' + versa.address + '&nbsp;&nbsp;&nbsp;' + versa.district + '</div></div>' + '<div class="collapsible-body"><div class="collection">' + '<div class="collection-item">' + "price : " + versa.price + '</div>' + '<div class="collection-item">' + "room : " + versa.room + '</div>' + '<div class="collection-item">' + "bedroom : " + versa.bedroom + '</div>' + '<div class="collection-item">' + "surface : " + versa.surface + '</div>' + '</div></div>' + '</li>');
            });
          });
        };
        return rectangle.on('click', onRectangleClick);
      });
    });
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
