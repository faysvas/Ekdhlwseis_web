function mapLoad(){

var marker=[];
var map=[];
var vienna=[];

var i;
var layer = new ol.layer.Tile({
  source: new ol.source.OSM()
});
for(i=0;i<ids.length;i++){


console.log("id"+ids[i])
var lonlatstring=lonlat[i];
var coord = lonlatstring.split(',');
console.log("lonlat"+coord[0]);          

map[i] = new ol.Map({
  layers: [layer],
  target: 'map'+ids[i],
  view: new ol.View({
    center: [Number(coord[0]), Number(coord[1])],
    zoom: 13
  })
});


var lonlatCon = ol.proj.transform([Number(coord[0]),Number(coord[1])], 'EPSG:3857', 'EPSG:4326');
var lon = lonlatCon[0];
var lat = lonlatCon[1];
var pos = ol.proj.fromLonLat([lon, lat]);
console.log("pos"+pos);

// Vienna marker
marker[i] = new ol.Overlay({
  position: pos,
  positioning: 'center-center',
  element: document.getElementById('marker'+ids[i]),
  stopEvent: false
});
map[i].addOverlay(marker[i]);

// Vienna label
vienna[i] = new ol.Overlay({
  position: pos,
  element: document.getElementById('vienna')
});
map[i].addOverlay(vienna[i]);

// Popup showing the position the user clicked
var popup = new ol.Overlay({
  element: document.getElementById('popup')
});
map[i].addOverlay(popup);


}
}