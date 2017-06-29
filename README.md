# ttyvideo
Pushing the limits of resolution and color depth... backwards!  
ttyvideo is a video player that runs in a 256-color terminal.
## Dependencies
ttyvideo requires OpenCV (2 or 3) compiled with video codecs. If your package manager doesn't carry a version of OpenCV like this, you're going to need to download and compile its [source code](https://github.com/opencv/opencv "OpenCV source") before you can use ttyvideo.
ttyvideo also uses CMake>=2.8 to generate files used in the installation process.
## Installation
You can compile ttyvideo with CMake and Make.
```shell
cmake .
make
```
After compiling, it can be installed by performing
```shell
sudo make install
```

## How it works
ttyvideo works with most visual media types: videos, images, GIFs, etc. This is due to the usage of OpenCV to read media.  
Right now, ttyvideo doesn't do anything special when rendering videos.  
ttyvideo will scale any video to fit the aspect ratio of the terminal it's running in. ttyvideo also does not perform any smoothing operations; each character slot in the terminal corresponds to exactly one pixel in the source video, not a combination of them. Feel free to add smoothing ttyvideo!
