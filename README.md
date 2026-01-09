# Inception

This project sets up a **WordPress site** with **MariaDB** and **Nginx** using Docker and Docker Compose.

## Project Structure

```
.
├── Makefile
├── .env
└── srcs
    ├── docker-compose.yml
    └── requirements
        ├── mariadb
        │   ├── Dockerfile
        │   └── mdb-conf.sh
        ├── nginx
        │   ├── Dockerfile
        │   └── nginx.conf
        └── wordpress
            ├── Dockerfile
            └── wp_conf.sh
```

## Requirements

- Docker
- Docker Compose
- Make

## Setup

1. Create a `.env` file with your configuration variables.
2. Build and start the containers:

```
make up
```

3. Stop the containers:

```
make down
```

4. Rebuild everything:

```
make re
```

5. Clean all containers, images, and volumes:

```
make prune
```

## Volumes

- `mariadb` → `${HOME}/data/mariadb`
- `wordpress` → `${HOME}/data/wordpress`

## Notes

- WordPress will be available at `https://<your-domain>`
- Nginx uses a self-signed SSL certificate by default

## Todo

- Add an `.env.example` file for easier setup
