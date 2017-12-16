map = null
(->
  $ ->
    map = L.map('mapid').setView([31.2693561718426,121.48392735101], 11);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
    $.ajax("/fetcharea").done (json) ->
      json.forEach (element, i)  ->
        rectangle = L.rectangle([[element[1],element[0]],[element[1]+0.005,element[0]+0.005]], {color: "red", weight: 0.7}).addTo(map);
        onRectangleClick =(e) ->
            M.toast({html: 'You click on rectange'})
            #$.ajax(url: "/gather/"+element[1]*1000+"/"+element[0]*1000).done (html) ->
            $.ajax(url: "/hackathonmock").done (html) ->
              $("#mylist").html("")
              html.forEach (versa, i) ->
                $("#mylist").append('<li>'+
                        '<div class="collapsible-header">'+
                          '<div class="left">Appartement '+i+'&nbsp;&nbsp;&nbsp;'+'</div><div class="right">'+ versa.address+'&nbsp;&nbsp;&nbsp;'+ versa.district+'</div></div>'+
                        '<div class="collapsible-body"><div class="collection">'+
                        '<div class="collection-item">'+"price : "+versa.price+'</div>'+
                        '<div class="collection-item">'+"room : "+versa.room+'</div>'+
                        '<div class="collection-item">'+"bedroom : "+versa.bedroom+'</div>'+
                        '<div class="collection-item">'+"surface : "+versa.surface+'</div>'+
                          '</div></div>'+
                      '</li>')
              #eval(html)
        rectangle.on('click', onRectangleClick);
        #L.marker([element.latitude,element.longitude]).bindPopup(
        #  '<div class="collection">'+
        #  '<div class="collection-item">'+"address : "+element.address+'</div>'+
        #  '<div class="collection-item">'+"price : "+element.price+'</div>'+
        #  '<div class="collection-item">'+"surface : "+element.surface+'</div>'+
        #  '<div class="collection-item">'+"bedroom : "+element.bedroom+'</div>'+
        #  '</div>'
        #).addTo(this.map)
      #eval(js) the code is already evaledk
  return
).call this
