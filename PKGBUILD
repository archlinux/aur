# Fake package to convince ROS to use the native opencv3 package.
pkgdesc="ROS - OpenCV 3.x."
url='http://opencv.org'

pkgname='ros-kinetic-opencv3-native'
pkgver='3.4.0'
arch=('any')
pkgrel=1
license=('BSD')
provides=('ros-kinetic-opencv3')
conflicts=('ros-kinetic-opencv3')

ros_depends=(ros-kinetic-catkin)
depends=(${ros_depends[@]}
  protobuf
  libjpeg-turbo
  vtk
  zlib
  python2-numpy
  python2
  jasper
  libpng
  ffmpeg
  libharu
  opencv)
