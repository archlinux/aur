# Maintainer: nightsense <nightsense at protonmail dot ch>

pkgname=fuji
pkgver=1.0
pkgrel=1
pkgdesc="A simple usb drive mounter"
arch=('any')
url="https://github.com/nightsense/fuji"
license=('GPL3')
optdepends=('ntfs-3g: for ntfs formatting/mounting')
source=("https://github.com/nightsense/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('ef33b8530c099c46ef047d760f79ac0ce9a9b6fb3064ddf3a4d0d4261e49288d')

package() {
  install -D -m 755 fuji "${pkgdir}/usr/bin/fuji"
}
