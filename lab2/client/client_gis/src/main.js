import 'ol/ol.css';
import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import ImageLayer from 'ol/layer/Image';
import ImageWMS from 'ol/source/ImageWMS';

const map = new Map({
  target: 'map',
  layers: [
    new TileLayer({
      source: new OSM()
    })
  ],
  view: new View({
    center: [0, 0],
    zoom: 2
  })
});

const wmsUrl = 'http://localhost:8080/geoserver/gis/wms';

// Слой "Здания"
const buildingsLayer = new ImageLayer({
  source: new ImageWMS({
    url: wmsUrl,
    params: {
      'LAYERS': 'gis:buildings',
      'TILED': true,
      'FORMAT': 'image/png'
    },
    ratio: 1,
    serverType: 'geoserver'
  }),
  visible: true
});

// Слой "Дороги"
const roadsLayer = new ImageLayer({
  source: new ImageWMS({
    url: wmsUrl,
    params: {
      'LAYERS': 'gis:roads',
      'TILED': true,
      'FORMAT': 'image/png'
    },
    ratio: 1,
    serverType: 'geoserver'
  }),
  visible: true
});

// Слой "POI" (точки интереса)
const poiLayer = new ImageLayer({
  source: new ImageWMS({
    url: wmsUrl,
    params: {
      'LAYERS': 'gis:poi',
      'TILED': true,
      'FORMAT': 'image/png'
    },
    ratio: 1,
    serverType: 'geoserver'
  }),
  visible: true
});

map.addLayer(buildingsLayer);
map.addLayer(roadsLayer);
map.addLayer(poiLayer);

// --- 3. (Опционально) Управление видимостью через кнопки ---
document.getElementById('toggleBuildings').addEventListener('click', () => {
  buildingsLayer.setVisible(!buildingsLayer.getVisible());
});

document.getElementById('toggleRoads').addEventListener('click', () => {
  roadsLayer.setVisible(!roadsLayer.getVisible());
});

document.getElementById('togglePoi').addEventListener('click', () => {
  poiLayer.setVisible(!poiLayer.getVisible());
});


const center = [50.482017517089844, 54.29159164428711]; // координаты из геосервера чтоб сразу было
import { fromLonLat } from 'ol/proj';
map.getView().setCenter(fromLonLat(center));
map.getView().setZoom(15);