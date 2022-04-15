# saltmaster
An Ubuntu container preloaded with salt

## startup
cd /{REPO}
sudo docker build -t saltmaster .
sudo docker run -it --restart=unless-stopped --privileged=true --name saltmaster saltmaster
