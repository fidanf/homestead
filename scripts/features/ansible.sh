#!/bin/bash -e

if [ -f /home/vagrant/.homestead-features/ansible ]
then
    echo "ansible already installed."
    exit 0
fi

# Install python packages
sudo apt-get update
sudo apt-get install -y python3 python3-apt python3-testresources python3-distutils

# Update symlinks
sudo ln -sf /usr/bin/python3 /usr/bin/python
sudo ln -sf /usr/bin/pip3 /usr/bin/pip

# Install pip from source
curl -skL https://bootstrap.pypa.io/get-pip.py | python3

# Installs ansible along with other components
pip install --upgrade --ignore-installed --requirement /vagrant/requirements.txt

# Display current ansible version
ansible --version
# Display current molecule version
molecule --version

touch /home/vagrant/.homestead-features/ansible
