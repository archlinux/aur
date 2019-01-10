# Maintainer: Ben <ben@ported.pw>

pkgname=apm_planner-bin
pkgver=2.0.26
pkgrel=2
pkgdesc="Ground Control Station for MAVlink based autopilots (e.g. Ardupilot) (binary version)"
arch=('x86_64')
url="http://ardupilot.org/planner2/"
license=('GPL3')
groups=('base-devel')
depends=('qt5-base' 'qt5-serialport' 'qt5-svg' 'qt5-script' 'qt5-declarative' 'sdl2' 'flite1' 'libsndfile' 'python' 'python-pexpect')
source=("http://firmware.ardupilot.org/Tools/APMPlanner/apm_planner_${pkgver}_bionic64.deb")
sha256sums=('e0a7d0981bc4684788231417c7dfdb7f2500ed75b1a8a82a2f2be6a21a4d6681')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}
