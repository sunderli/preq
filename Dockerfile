FROM python:3.8 AS pyenv
ENV PYTHONUNBUFFERED 1

WORKDIR /app/iqgeo

RUN apt-get update && apt-get install -y \
    apache2 \
    apache2-utils \
    apache2-dev \
    libexpat1 \
    ssl-cert \
    libapache2-mod-wsgi-py3 \
    && rm -rf /var/lib/apt/lists/*

RUN python -m venv /opt/venv

# Enable venv
ENV VIRTUAL_ENV /opt/venv
ENV PATH "/opt/venv/bin:$PATH"

RUN pip install mod_wsgi




# Enable venv
ENV VIRTUAL_ENV /opt/venv
ENV PATH "/opt/venv/bin:$PATH"

COPY ./apache2 /etc/apache2
# RUN a2enconf mod_wsgi
CMD ["apachectl", "-D" ,"FOREGROUND"]

