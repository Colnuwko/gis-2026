import 'ol/ol.css';

import Map from 'ol/Map';
import View from 'ol/View';

import TileLayer from 'ol/layer/Tile';
import ImageLayer from 'ol/layer/Image';
import VectorLayer from 'ol/layer/Vector';

import OSM from 'ol/source/OSM';
import ImageWMS from 'ol/source/ImageWMS';
import VectorSource from 'ol/source/Vector';

import GeoJSON from 'ol/format/GeoJSON';
import {fromLonLat} from "ol/proj.js";
import { applyStyle } from 'ol-mapbox-style';

const wmsUrl = 'http://localhost:8080/geoserver/gis/wms';



const buildingsLayer = new ImageLayer({
  source: new ImageWMS({
    url: wmsUrl,
    params: {
      LAYERS: 'gis:buildings',
      TILED: true,
      FORMAT: 'image/png'
    },
    ratio: 1,
    serverType: 'geoserver'
  }),
  visible: true
});

const roadsLayer = new ImageLayer({
  source: new ImageWMS({
    url: wmsUrl,
    params: {
      LAYERS: 'gis:roads',
      TILED: true,
      FORMAT: 'image/png'
    },
    ratio: 1,
    serverType: 'geoserver'
  }),
  visible: true
});

const poiLayer = new ImageLayer({
  source: new ImageWMS({
    url: wmsUrl,
    params: {
      LAYERS: 'gis:poi',
      TILED: true,
      FORMAT: 'image/png'
    },
    ratio: 1,
    serverType: 'geoserver'
  }),
  visible: true
});



const overtureLayer = new VectorLayer({
  source: new VectorSource({
    url: './overture.geojson',
    format: new GeoJSON()
  }),
  visible: true
});



applyStyle(overtureLayer, './style.json');
//
// Карта
//

const map = new Map({
  target: 'map',

  layers: [
    new TileLayer({
      source: new OSM()
    }),

    buildingsLayer,
    roadsLayer,
    poiLayer,
    overtureLayer
  ],

  view: new View({
    center: [50.4820175, 54.2915916],
    zoom: 15,
    projection: 'EPSG:4326'
  })
});

//
// Кнопки управления слоями
//

document.getElementById('toggleBuildings')
  .addEventListener('click', () => {
    buildingsLayer.setVisible(
      !buildingsLayer.getVisible()
    );
  });

document.getElementById('toggleRoads')
  .addEventListener('click', () => {
    roadsLayer.setVisible(
      !roadsLayer.getVisible()
    );
  });

document.getElementById('togglePoi')
  .addEventListener('click', () => {
    poiLayer.setVisible(
      !poiLayer.getVisible()
    );
  });

document.getElementById('toggleOverture')
  .addEventListener('click', () => {
    overtureLayer.setVisible(
      !overtureLayer.getVisible()
    );
  });