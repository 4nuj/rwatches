import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }


    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window_html) // Add this
          // Create a HTML element for your custom marker
        const customMarker = document.createElement("div")
        customMarker.innerHTML = marker.marker_html

        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup) // Add this
          .addTo(this.map)
      });
    }


  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();

    // Extend bounds with central London coordinates
    bounds.extend([-0.1276, 51.5074]); // Central London coordinates (longitude, latitude)

    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]));

    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }


}
