FROM netboxcommunity/netbox:v3.4

COPY ./requirements.txt /
RUN /opt/netbox/venv/bin/pip install  --no-warn-script-location -r /requirements.txt

COPY ./configuration/plugins.py /etc/netbox/config/.
RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
