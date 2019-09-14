# GeoServer in a docker based environment

A container based installation of GeoServer including a PostGIS database


## User Story
As a PO I want to have a fast geo service (WMS) providing the OSM map in order to use OSM map data to other services like Quality Heatmap, Tracking & Tracing, manual booking, and similar systems that need a map visualization. 

## GeoServer solution
After some research we decided to setup a server based on the open-source software GeoServer (http://geoserver.org/). 
The main reason for choosing GeoServer where:

* open-source, hence no license fees
* provides all necessary service protocolls (i.e. WMS, WFS)
* can use all necessary data sources (i.e. PostGIS, WMS, WFS)
* Java based software
* good maturity (development started in 2003, current version is 2.15)
* huge and active open-source community

First integration of GeoServer was using prerendered maps and providing them as WMS services. This worked fine, but the amount of storage for prerendered tiles grew and grew.

# Second approach
As the amount of data to be pre-rendering had grown massivly, we thought about switching to online rendering, but we had two main obstacles:

Speed: the rendering speed had to be improved in order to have acceptable user experience on a decent machine
Visialization: Everybody is used to the style of Google Maps, Apple Maps, or OSM. In order to have something similar we had to apply similar styles in the rendering
Speed
GeoServer implements a cache for already rendered tiles. In this cache it stores the tiles for a predefined time. So, whenever the user looks at a region for the first time, it is slow because of the rendering, but as the user looks around, zooms in or out, the visualization becomes quicker, because it shows prerendered tiles from the cache. A very smart feature that helps, but was not enough!

Visualization
The official OpenstreetMap visualization uses a CartoCSS style which ist public (https://github.com/gravitystorm/openstreetmap-carto) but GeoServer cannot use CartoCSS styles and conversion are loosing much of the quality of the original visualization.

In my research on this topic then found the work done by Anrea Aime of GeoSolutions (https://github.com/geosolutions-it/osm-styles).
With this I developed a Docker based testing system including four container images
* PostGIS container image for storing OSM data
* Import container image for importing data to the database
* GeoServer container image
* OpenLayers presentation container for a brief demonstration

# Installation
TBD


# Software links:

* Styles and import configuration: https://github.com/geosolutions-it/osm-styles
* Import Tool at GitHub: https://github.com/omniscale/imposm3
* Import tool documentation: https://imposm.org/docs/imposm3/latest/tutorial.html
* GeoServer docker container: https://github.com/GeoNode/geoserver-docker
* PostGIS docker container: https://hub.docker.com/r/mdillon/postgis
* CartoCSS: https://github.com/gravitystorm/openstreetmap-carto
* OSM Maps download: https://download.geofabrik.de/europe.html
* ...