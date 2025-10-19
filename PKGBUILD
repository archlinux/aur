# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=ports-info
pkgname="$_pkgname-bin"
pkgver=1.0
_pkgver='1.0.0-1'
pkgrel=1
pkgdesc="Simple utility to show open ports on linux systems"
arch=('x86_64')
url="https://github.com/mfat/ports-info"
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'python-psutil')
provides=("$_pkgname")
source=("https://github.com/mfat/ports-info/releases/download/v${pkgver}/ports-info_${_pkgver}_amd64.deb")
sha256sums=('30e06abf821ba7f42477567e485658cae8eae3d9bda8fc5389dd465f951e964a')

package() {
  echo "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.zst -C "$pkgdir/"
}
