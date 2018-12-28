# Maintainer: Ben <ben@ported.pw>

pkgname=apm_planner-bin
pkgver=2.0.26
pkgrel=1
pkgdesc="Ground Control Station for MAVlink based autopilots (e.g. Ardupilot) (binary version)"
arch=('x86_64')
url="http://ardupilot.org/planner2/"
license=('GPL3')
groups=('base-devel')
depends=('qt5-base' 'qt5-serialport' 'qt5-svg' 'qt5-script' 'qt5-declarative' 'sdl2' 'flite1' 'libsndfile' 'python' 'python-pexpect')
source=("http://firmware.ardupilot.org/Tools/APMPlanner/apm_planner_${pkgver}_xenial64.deb")
md5sums=('0343dbd67c1c0c5ad5ae557922684912')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}
