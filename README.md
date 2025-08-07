# Homelabdash

A simple dashboard and homepage for homelabbers.

## Overview

**Homelabdash** is designed to provide homelab enthusiasts with a straightforward dashboard and homepage, helping users organize, access the various services and endpoints running within their homelab environments.

## Features

- Centralized dashboard for homelab services
- Customizable homepage for quick access to tools and endpoints
- Simple, lightweight, and easy to deploy

## Getting Started

### Prerequisites

- [Docker](https://www.docker.com/) installed on your system

### Installation

1. Create the config file:
```sh
mkdir ./homelabdash_config    
touch ./homelabdash_config/dashboard.yml
```

```yaml
title: "My Dashboard"
theme: 'dark'
sections:
  - title: "Media"
    services:
      - name: "Jellyfin"
        url: "http://myjellyfin.internal"
      - name: "Jellyseerr"
        url: "http://myjellyseerr.internal"
  - title: "Services"
    services:
      - name: "Radarr"
        url: "http://radarr.internal"
      - name: "Sonarr"
        url: "http://sonarr.internal"
  - title: "External Links"
    services:
      - name: "Github"
        url: "https://github.com/bepisdev"
```

2. Run the Homelabdash container:
```sh
docker run \
    -d \
    --name homelabdash \
    -p 3333:3333 \
    -v ./homelabdash_config:/config \
    joshburnsxyz/homelabdash:latest
```

3. Access the dashboard from your browser at [http://localhost:3333](http://localhost:3333).

## Contributing

Contributions are welcome! Please open issues or submit pull requests to improve features, fix bugs, or add functionality.

## Todo:

- [ ] Make port assignable via environment variable
- [x] Publish docker image on docker hub
- [ ] More extensive UI work
- [ ] Tests
- [ ] Rewrite server to utilise the proper class based Mojolicious server API
- [ ] Implement proper error pages
- [ ] Run server in production mode to prevent leaking debug information
- [ ] Write logs to file
- [ ] Create widgets for things like time and hardware metrics (I/O, resources used/available, etc.)
- [ ] Create integration widgets for common apps like radarr and sonarr calendars
