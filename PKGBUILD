pkgname=ros-kinetic-python2-fix
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple symlink that will help ROS kinetic use Python2 by default."
url="http://wiki.ros.org/kinetic/Installation/Arch"
depends=('python2')
license=('BSD')
arch=('any')

package() {
	ls -s /opt/ros/kinetic/bin/python /usr/bin/python2
}
