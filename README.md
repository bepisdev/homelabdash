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

1. Clone the repository:
   ```sh
   git clone https://github.com/bepisdev/homelabdash.git
   cd homelabdash
   ```

2. Build the Docker image:
   ```sh
   docker build -t homelabdash .
   ```

### Usage

1. Run the Homelabdash container:
   ```sh
   docker run -d --name homelabdash -p 3333:3333 homelabdash
   ```
2. Access the dashboard from your browser at [http://localhost:3333](http://localhost:3333).

## Contributing

Contributions are welcome! Please open issues or submit pull requests to improve features, fix bugs, or add functionality.

## Todo:

- [ ] Make port assignable via environment variable
- [ ] Publish docker image on docker hub
- [ ] More extensive UI work
- [ ] Tests
- [ ] Rewrite server to utilise the proper class based Mojolicious server API
- [ ] Implement proper error pages
- [ ] Run server in production mode to prevent leaking debug information
- [ ] Write logs to file
- [ ] Create widgets for things like time and hardware metrics (I/O, resources used/available, etc.)
- [ ] Create integration widgets for common apps like radarr and sonarr calendars
