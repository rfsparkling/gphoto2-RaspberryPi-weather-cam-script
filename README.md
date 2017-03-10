# gphoto2-RaspberryPi-weather-cam-script
This script capable to executed from cron, capturing camera image, copying localy and uploading that to a given FTP server.
Sunset - sunrise follower long time exposure weather cam from a Canon PowerShot

# first install sunwait and gphoto2:

```wget http://www.risacher.org/sunwait/sunwait-20041208.tar.gz
tar xzvf sunwait-20041208.tar.gz
cd sunwait-20041208
make
sudo install sunwait /usr/bin/sunwait```

```sudo apt-get install gphoto2```


Then running the script first it calculates sunset and sunrise and decide to run the camera in day mode (Auto) or in long exposure (Tv) mode. 
Mine tested with Canon PowerShot IS5, it has Auto and Tv modes, it has to be programmed in gphoto2 --config menu.

[demo video:](https://youtu.be/rtHzb5t4Lco)
[![demo video](https://github.com/rfsparkling/gphoto2-RaspberryPi-weather-cam-script/blob/master/snapshot.png)](https://youtu.be/rtHzb5t4Lco "Weather cam example")
