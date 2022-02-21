# Maintainer: TankMissile <customerservicerobot@protonmail.com>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=python-blivet
pkgver=3.4.3
_tag="blivet-$pkgver"
pkgrel=1
pkgdesc="A DBus service and python module for management of the system storage configuration"
url="https://fedoraproject.org/wiki/Blivet"
arch=("any")
license=("LGPL2.1")
depends=("python"
         "python-six"
         "python-pyparted"
         "python-pyudev"
         "python-gobject"
         "libblockdev"
         "lsof"
         "multipath-tools"
         "util-linux"
         "systemd-libs"
)
makedepends=("python-setuptools" "make")
source=("https://github.com/storaged-project/blivet/archive/$_tag.tar.gz")
sha256sums=("587741657ab35e05f61afb06a01540fb3650300e16d0a20fd551839dd223eaf3")

package() {
  cd blivet-$_tag

  python setup.py install --root="${pkgdir}/" --optimize=1
}
