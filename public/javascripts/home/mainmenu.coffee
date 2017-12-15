map = null
(->
  $ ->
    map = L.map('mapid').setView([31.3193561718426,121.34392735101], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    circle = L.circle([31.3193561718426,121.34392735101], {
      color: 'red',
      fillColor: '#f03',
      fillOpacity: 0.5,
      radius: 500
    }).addTo(map);

    onCircleClick =(e) ->
        M.toast({html: 'You click on circle'})
        $.ajax(url: "/home/fetchflat").done (html) ->
          #eval(html)
    circle.on('click', onCircleClick);
  return
).call this
