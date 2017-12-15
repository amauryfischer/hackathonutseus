var mymap;

mymap = null;

(function() {
  $(function() {
    var apikey, circle, firsturl, layergroupid, templateId;
    circle = void 0;
    mymap = L.map('mapid').setView([51.505, -0.09], 13);
    apikey = "ffe16978016d14d45a2721f15d664911bb9db652";
    layergroupid = "amauryfischer@58574a43@9a088060bba07b2e3cb556ecf040f3cc:1513234033389";
    firsturl = "https://amauryfischer.carto.com/api/v1/map/named?api_key=ffe16978016d14d45a2721f15d664911bb9db652";
    templateId = "tpl_d0df8fd4_e4c5_4d9f_9535_050ae32754af";
    L.tileLayer('https://{s}.amauryfischer.carto.com/api/v1/map/named/test22/all/{z}/{x}/{y}.png', {
      maxZoom: 18,
      id: 'mapbox.streets',
      accessToken: 'your.mapbox.access.token'
    }).addTo(mymap);
    circle = L.circle([51.508, -0.11], {
      color: 'red',
      fillColor: '#f03',
      fillOpacity: 0.5,
      radius: 500
    }).addTo(mymap);
    return $('#addMarker').click(function(e) {
      return $.ajax({
        url: 'leafletview/addMarker'
      }).done(function(html) {});
    });
  });
}).call(this);
