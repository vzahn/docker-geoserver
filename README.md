# GeoServer in a docker based environment

A container based installation of GeoServer including a PostGIS database


## User Story
As a PO I want to have a fast geo service (WMS) providing the OSM map in order to use OSM map data to other services like Quality Heatmap, Tracking & Tracing, Manual Toll booking, and similar systems that need a map visualization. 

## First solution
First of all the decision on which server to use had to be made. After some research we decided to setup a server based on the open-source software GeoServer (http://geoserver.org/). 

The main reason for choosing GeoServer where:

* open-source, hence no license fees
* provides all necessary service protocolls (i.e. WMS, WFS)
* can use all necessary data sources (i.e. PostGIS, WMS, WFS)
* Java based software
* good maturity (development started in 2003, current version is 2.15)
* huge and active open-source community


Now, the big question when providing map data is always, whether to use pre-rendered tiles or render online.

Both ways have their advantages ... and disadvantages:


|                    | Advantages | Disadvantages |
| ------------------ | ---------- | ------------- |
| Pre-rendered tiles | Fast access for the user | Huge amount of data has to be processed and stored |
| | | Tiles have to be re-rendered with every update |
| Online Rendering   | Slow access	 | Minimal amount of data to be stored |
| | | Always up-to-date |

Our first approach for serving OSM data on a WMS wath to use pre-rendered data, which we already had available frm the road user portal (RUP) ... at least for Belgium.

The solution worked fine, but then there was the requirement to show also Germany ... and Austria, and Bulgaria ... and in the end maybe Europe?



Thus we went on the way for either a good and fast pre-rendering software or maybe change to online rendering!

# Second approach
As the amount of data to be pre-rendering had grown massivly, we thought about switching to online rendering, but we had two main obstacles:

Speed: the rendering speed had to be improved in order to have acceptable user experience on a decent machine
Visialization: Everybody is used to the style of Google Maps, Apple Maps, or OSM. In order to have something similar we had to apply similar styles in the rendering
Speed
GeoServer implements a cache for already rendered tiles. In this cache it stores the tiles for a predefined time. So, whenever the user looks at a region for the first time, it is slow because of the rendering, but as the user looks around, zooms in or out, the visualization becomes quicker, because it shows prerendered tiles from the cache. A very smart feature that helps, but was not enough!

Visualization
The official OpenstreetMap visualization uses a CartoCSS style which ist public (https://github.com/gravitystorm/openstreetmap-carto) but GeoServer cannot use CartoCSS styles and conversion are loosing much of the quality of the original visualization.



In my research on this topic then found this:





To be continued ...



# Software links:

* Styles and import configuration: https://github.com/geosolutions-it/osm-styles
* Import Tool at GitHub: https://github.com/omniscale/imposm3
* Import tool documentation: https://imposm.org/docs/imposm3/latest/tutorial.html
* GeoServer docker container: https://github.com/GeoNode/geoserver-docker
* PostGIS docker container: https://hub.docker.com/r/mdillon/postgis
* CartoCSS and Kosmtik tile server: https://github.com/vzahn/openstreetmap-carto/blob/master/DOCKER.md
* OSM Maps download: https://download.geofabrik.de/europe.html
* ...
