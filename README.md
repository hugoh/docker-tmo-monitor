# Dockerized T-Mobile Home Internet monitor

This is a Dockerized version of [highvolt-dev/tmo-monitor](https://github.com/highvolt-dev/tmo-monitor).

It's published at [hugohh/tmo-monitor](https://hub.docker.com/hugohh/tmo-monitor).

## Usage

Start the docker container with:

* Your env file mapped to `/.env`.
* A crontab file mapped to `/crontab`.

## Example

Running the container as:

```sh
docker run -v /etc/localtime:/etc/localtime:ro -v $PWD/monitor.env:/.env:ro -v $PWD/monitor.crontab:/crontab:ro hugohh/tmo-monitor:latest
```

with the following crontab:

```
*/2 * * * * /tmo-monitor/tmo-monitor.py --skip-bands
1 4 * * * /tmo-monitor/tmo-monitor.py --skip-ping
```

will run a ping test every 2 minutes and a band test every day at 4:01am.
