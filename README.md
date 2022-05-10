# Dockerized T-Mobile Home Internet monitor

This is a [Dockerized version](https://github.com/hugoh/docker-tmo-monitor) of [highvolt-dev/tmo-monitor](https://github.com/highvolt-dev/tmo-monitor), a "lightweight, cross-platform Python 3 script that can monitor the T-Mobile Home Internet Nokia 5G Gateway for 4G/5G bands, cellular site (tower), and internet connectivity and reboots as needed or on-demand."

* **Monitor source code:** <https://github.com/highvolt-dev/tmo-monitor>
* **Container source code:** <https://github.com/hugoh/docker-tmo-monitor>
* **Docker hub home:** <https://hub.docker.com/r/hugohh/tmo-monitor>

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
*/2 * * * * /tmo-monitor/bin/tmo-monitor.py --skip-bands
1 4 * * * /tmo-monitor/bin/tmo-monitor.py --skip-ping
```

will run a ping test every 2 minutes and a band test every day at 4:01am.
