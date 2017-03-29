#!/bin/bash

# install Google Python client on all nodes
apt-get update
apt-get install -y python-pip
pip install --upgrade google-api-python-client

# git clone on Master
USER=USER_NAME  # change this if neccessary
ROLE=$(/usr/share/google/get_metadata_value attributes/dataproc-role)
if [[ "${ROLE}" == 'Master' ]]; then
  cd /home/$USER
  git clone https://github.com/GoogleCloudPlatform/training-data-analyst
  #=chown -R $USER training-data-analyst/
fi
