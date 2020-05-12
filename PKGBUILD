# Maintainer: Jan-Tarek Butt <tarek@ring0.de>
pkgbase=ros-melodic-soem
pkgname=ros-melodic-soem
pkgver=1.4.0
pkgrel=1
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
license=('LGPL2')
pkgdesc="ROS wrapper for the Simple Open EtherCAT Master SOEM. This is an updated version of the original SOEM wrapper released into ROS now including the upstream Repo as a git subtree."
provides=('ros-melodic-soem')

source=("${pkgname}-${pkgver}.deb"::"http://packages.ros.org/ros/ubuntu/pool/main/r/ros-melodic-soem/${pkgname}_${pkgver}-1bionic.20200303.055401_amd64.deb")
sha256sums=('636c049ff907dd9a711727c86ff382b3fb85a2fa194029945ea540ce7a77bef8')

build() {
	cd "${srcdir}"
	# unpack
	tar --xz -xf data.tar.xz
}

package() {
	cp -r "${srcdir}"/opt "${pkgdir}"/opt
}
