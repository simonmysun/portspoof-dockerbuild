# Portspoof Docker Container

A dockerized version of [Portspoof](https://github.com/drk1wi/portspoof), a service that creates protocols decoys and spoofs services signatures.

## Usage

Check `docker-compose.yml` and start the container using Docker Compose:

```sh
docker compose up
```

This will:
- Build the container from Alpine Linux 3.21
- Install and configure Portspoof
- Expose ports 4444-4449 (for example usage)
- Run Portspoof with signature-based service emulation and default configuration

## Configuration
- The container uses the default Portspoof configuration from `/etc/portspoof/portspoof.conf`. You can mount your own configuration files or set command-line options as needed.
- Service signatures are loaded from `/etc/portspoof/portspoof_signatures`

For detailed usage, see https://github.com/drk1wi/portspoof/blob/master/DOC

## Validation

```sh
nmap -sV -p 4444-4449 localhost
```
