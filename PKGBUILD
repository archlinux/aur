# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Metapackage allowing easy installation of Velodyne simulation components."
url='http://wiki.ros.org/velodyne_simulator'

pkgname='ros-melodic-velodyne-simulator'
pkgver='1.0.12'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-rospack
	ros-melodic-catkin
         
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-ros-environment
	ros-melodic-rospack
	ros-melodic-catkin
        ros-melodic-velodyne-description
        ros-melodic-velodyne-gazebo-plugins
)

depends=(
	${ros_depends[@]}
	python-rospkg
)
