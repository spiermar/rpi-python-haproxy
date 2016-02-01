FROM hypriot/rpi-python:2.7
MAINTAINER Martin Spier <spiermar@gmail.com>

# get up to date
RUN apt-get update --fix-missing

# install supervisord
RUN apt-get install -y supervisor

# stop supervisor service as we'll run it manually
RUN service supervisor stop

# create a virtual environment and install all dependencies from pypi
RUN virtualenv /opt/venv
ADD requirements.txt /opt/venv/requirements.txt
RUN /opt/venv/bin/pip install -r /opt/venv/requirements.txt

# install gunicorn
RUN /opt/venv/bin/pip install gunicorn

# expose port(s)
EXPOSE 80

# install supervisor-stdout
RUN pip install supervisor-stdout

# file management, everything after an ADD is uncached, so we do it as late as
# possible in the process.
ADD supervisord.conf /etc/supervisord.conf

# copy the application
ADD src/ /opt/app

# start supervisor to run our wsgi server
CMD supervisord -c /etc/supervisord.conf -n
