## Overview

**edge-flow** is an edge computing system designed to process data from edge devices and forward it to a cloud service. The system consists of three main components: an edge device, a cloud service, and an Nginx server for load balancing. The project is implemented using Elixir and Erlang, with Docker for containerization.

## Components

1. **Edge Device**

   - Processes incoming data and sends it to the cloud service.
   - Uses Elixir for implementation.

2. **Cloud Service**

   - Receives data from edge devices.
   - Implemented using Erlang.

3. **Nginx**
   - Acts as a load balancer to distribute requests among edge devices.

## Setup

1. **Clone the repository**

   ```sh
   git clone https://github.com/reivosar/edge-flow.git
   cd edge-flow
   ```

2. **Build and start the services**

   ```sh
   docker-compose up --build
   ```

3. **Execute below command**
   ```sh
   wrk -t12 -c400 -d30s http://localhost:80/data -s post.lua
   ```

## Configuration

### Docker Compose

- Manages the orchestration of the edge device, cloud service, and Nginx.
- Configuration file: `docker-compose.yml`

### Nginx

- Load balancing configuration.
- Configuration file: `nginx.conf`

### Environment Variables

- JWT_SECRET for token-based authentication.
- Set in the `docker-compose.yml` file.

## Project Structure

- `cloud_service/` - Erlang implementation of the cloud service.
- `edge_device/` - Elixir implementation of the edge device.
- `nginx.conf` - Configuration file for Nginx.
- `docker-compose.yml` - Docker Compose configuration.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

For more details, visit the [edge-flow GitHub repository](https://github.com/reivosar/edge-flow).
