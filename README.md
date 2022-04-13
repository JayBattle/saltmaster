# saltmaster
An Ubuntu container preloaded with salt

## startup
cd /{REPO}
docker build -t saltmaster .
docker run -it --restart=unless-stopped --privileged=true --name saltmaster saltmaster
