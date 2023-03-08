## DigitalOcean DDNS // Alpine Linux

![Docker Pulls](https://img.shields.io/docker/pulls/justinpatchett/docker-digitalocean-ddns)

[☕ Buy me a coffee! ☕](https://www.buymeacoffee.com/jlaptech)

## Description

---
Minimal Docker image (~13Mb) using Alpine Linux and shell to update a dynamic DNS 
(DDNS) `A` record entry using the DigitalOcean v2 API.

## Configuration

---
#### `./config.json`
```json
{
  "domain": "",
  "ddns": "",
  "apikey": ""
}
```

`domain`: The full domain name key as seen in digitalocean e.g. example.com

`ddns`: The subdomain of the full domain e.g. ddns (ddns.example.com) as an A record

`apikey`: The DigitalOcean API v2 API key to be used

The token to be used requires write access.

![access-token-scopes.png](https://github.com/jlaptechnologies/docker-digitalocean-ddns/raw/master/access-token-scopes.png)

## Usage

---

First, grab a copy of the image and run it:

```shell
docker run --name my-digitalocean-ddns justinpatchett/docker-digitalocean-ddns:latest
```

OR

build the image locally (~13Mb):

```shell
docker build -t justinpatchett/docker-digitalocean-ddns:latest .
```

Whichever method you choose, fill out your `config.json` (does not have to be in the same directory):

```json
{
  "domain": "example.com",
  "ddns": "ddns",
  "apikey": "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
}
```

### "Always On" Usage

---

Start the container:

```shell
docker run --name my-digitalocean-ddns justinpatchett/docker-digitalocean-ddns
```

Copy the config file to the container (make sure line endings are LF), e.g. 

```shell
docker cp /`pwd`/config.json my-digitalocean-ddns:/root/config.json
```

Run the script via `docker exec`

```shell
docker exec my-digitalocean-ddns updateip
```

### "One Shot" Usage

---

Uses a mounted volume to pass the config.json to its intended location, e.g.
```shell
docker run --rm --name my-digitalocean-ddns -v /`pwd`/config.json:/root/config.json justinpatchett/docker-digitalocean-ddns updateip
```

## Output

---

```shell
Attempting to get ddns of example.com from DigitalOcean API v2
The domain ID is 1234567
My current IP is 123.123.123.123
Setting ddns.example.com to 123.123.123.123
{ "domain_record": { "id": 1234567, "type": "A", "name": "ddns", "data": "123.123.123.123", "priority": null, "port": null, "ttl": 1800, "weight": null, "flags": null, "tag": null } }
```

## Notes

---

Installs 2 packages: `curl` for network operations and `jq` for shell querying of json encoded data.

Uses [api.ipfy.org](https://www.ipify.org/) to obtain the public ip of the network interface you're using.

[☕ Buy me a coffee! ☕](https://www.buymeacoffee.com/jlaptech)
