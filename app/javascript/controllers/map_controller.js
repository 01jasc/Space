import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
    static targets = ["show", "mapbtn"]
    static values = {
        apiKey: String,
        markers: Array
    }

    connect() {

        const map = document.querySelector("#map-btn")
        map.addEventListener("click", (e) => {
            e.preventDefault();
            this.showTarget.style.width = "100%";
            this.showTarget.style.height = "600px";
            this.#initializeMap()
        })
       


    }

    
    #initializeMap() {
        mapboxgl.accessToken = this.apiKeyValue

        this.map = new mapboxgl.Map({
            container: this.element,
            style: "mapbox://styles/mapbox/light-v10",
        })
        this.#addMarkersToMap()
        this.#fitMapToMarkers()
        this.map.setCenter([13.4050, 52.5200])
        this.map.setZoom(11)
    }

    
    #addMarkersToMap() {
        this.markersValue.forEach((marker) => {
            const popup = new mapboxgl.Popup().setHTML(marker.info_window)

            const customMarker = document.createElement("div")
            customMarker.className = "marker"
            customMarker.style.backgroundImage = `url('${marker.image_url}')`
            customMarker.style.backgroundSize = "contain"
            customMarker.style.width = "30px"
            customMarker.style.height = "30px"

            new mapboxgl.Marker(customMarker)
                .setLngLat([marker.lng, marker.lat])
                .setPopup(popup)
                .addTo(this.map)
        })
    }

    #fitMapToMarkers() {
        const bounds = new mapboxgl.LngLatBounds()
        this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
        this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    }
}