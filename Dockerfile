FROM netboxcommunity/netbox:v3.4

COPY ./requirements.txt /
RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /requirements.txt

# These lines are only required if your plugin has its own static files.
COPY configuration/configuration.py /etc/netbox/config/configuration.py
RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
