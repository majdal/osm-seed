# OSM SEED

osm-seed aims to provide an easily installable package for the OpenStreetMap software stack.

## Why?

OpenStreetMap runs open source software to manage geospatial data for the entire planet. It has given birth to an entire ecosystem of tools to edit, export and process spatial data.

Very often, one wants to manage geospatial datasets that cannot be added to the main OpenStreetMap project, either due to license restrictions, or because the data doesn't fit within the ambit of the OpenStreetMap project. However, it is still convenient and desirable to use the OpenStreetMap software backend, along with tools like JOSM to edit data, and `osmium` to export and process data.

The OpenStreetMap software stack has proven itself on a planetary scale, and has thousands of man hours of work behind it. This project aims to leverage this power, by making it simple to install and manage your own instance of the OpenStreetMap software.

## How?

This project provides docker container definitions for various aspects of the OpenStreetMap software stack, along with configuration scripts to run on a Kubernetes cluster.

### What's included now:

 - The OpenStreetMap Rails Port.
 - A container that runs `osmium` to export and import data.
 - A container that runs database backup.
 - A `Helm` [chart](https://www.helm.sh/), simplifying the process of deploying the entire system onto a Kubernetes cluster.


### Usage
For more details on installation, see [INSTALL.md](INSTALL.md).

## What's next?

Our immediate next goal is integrate a tile server. Eventually, the goal is include as many tools from the OSM ecosystem part of this stack. Take a look at our [roadmap](https://github.com/developmentseed/osm-seed/blob/master/ROADMAP.md), and help out if this project helps what you're trying to do! We are always interested in collaborations and contributions! If you are interested in contributing, please see the [Contributor Guidelines](CONTRIBUTING.md).


