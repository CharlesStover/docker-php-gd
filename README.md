# Docker PHP GD

A PHP/Apache Docker image configured to support the GD image library.

## Use

You'll need:
* `MY-APPLICATION`: a name for your container
* `MY-NETWORK`: a network for your container if it's behind a reverse proxy
  (optional)
* `MY-LOGS`: a path to your log directory (optional)
* `MY-PATH`: a path to your PHP application

```
docker run \
  --name MY-APPLICATION \
  --network MY-NETWORK \
  --volume //MY-LOGS:/var/log/apache2 \
  --volume //MY-PATH:/var/www/html \
  --detach \
  --restart always \
  charlesstover/docker-php-gd
```

## Example

```
docker run \
  --name spritesheet2gif-api \
  --network reverse-proxy \
  --volume //c/logs/spritesheet2gif-api:/var/log/apache2 \
  --volume //c/src/spritesheet2gif-api:/var/www/html \
  --detach \
  --restart always \
  charlesstover/docker-php-gd
```

If I point my reverse proxy to `spritesheet2gif-api:80`, Apache will execute
and serve the PHP files located in `//c/src/spritesheet2gif-api` and store logs
in `//c/logs/spritesheet2gif-api`.
