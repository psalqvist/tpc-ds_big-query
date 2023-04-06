# Run this on the VM to bootstrap

# Copy data generation script and mark as executable
gsutil cp -r gs://tcp-ds-data-gen .
cd tcp-ds-data-gen/
chmod +x dsdgen

# Install google fuse

export GCSFUSE_REPO=gcsfuse-bionic
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo apt-get update
sudo apt-get install gcsfuse

sudo usermod -a -G fuse $USER