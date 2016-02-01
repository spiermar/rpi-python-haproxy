# rpi-python-haproxy
Run two Python webservers behind haproxy with `docker-compose` on Raspberry Pi.

You have to install `docker-compose` as described in [https://github.com/hypriot/compose#installation-and-documentation](https://github.com/hypriot/compose#installation-and-documentation).

Then clone the repo and run all four containers.

```bash
git clone https://github.com/spiermar/rpi-python-haproxy
cd rpi-python-haproxy
docker-compose up
```
