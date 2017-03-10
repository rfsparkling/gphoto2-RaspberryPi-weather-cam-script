# gphoto2-RaspberryPi-weather-cam-script
Sunset - sunrise follower long time exposure weather cam from a Canon PowerShot

# first install sunwait:

```wget http://www.risacher.org/sunwait/sunwait-20041208.tar.gz
tar xzvf sunwait-20041208.tar.gz
cd sunwait-20041208
make
sudo install sunwait /usr/bin/sunwait```


Then running the script first it calculates sunset and sunrise and decide to run the camera in day mode (Auto) or in long exposure (Tv) mode. 
Mine tested with Canon PowerShot IS5, it has Auto and Tv modes, it has to be programmed in gphoto2 --config menu.
