CXX = g++
CXXFLAGS = -Os -Wall -Wunused -Wno-format-y2k -fno-exceptions -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_THREAD_SAFE -D_REENTRANT -DGMSP_X11
LDSTATICFLAGS = /usr/lib/libfltk_gl.so -lGLU -lGL /usr/lib/libfltk_images.so -lpng -lz -ljpeg /usr/lib/libfltk.so -lXext -lpthread -ldl -lm  -lX11 -lXpm -lXft -lfontconfig -lXinerama 
SUFFIX = 
TARGET = geomspace
prebuild:

postbuild:
