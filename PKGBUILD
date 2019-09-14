# Maintainer: timescam <rex.ky.ng at gmail dot com>
pkgname=bin32-zentile
pkgver=0.1.1
pkgrel=2
pkgdesc="Automatic Tiling for EWMH Complaint Window Managers. Pre-compiled. 32 bit"
arch=('i686')
url="https://github.com/blrsn/zentile"
license=('MIT')
depends=(
  'go'
)
optdepends=(
  'xorg-server: with EWMH Complaint Window Managers'
)
provides=('zentile')
conflicts=(
  'zentile-bin'
  'zentile-git'
)

source_i686=("https://github.com/blrsn/zentile/releases/download/v${pkgver}/zentile_linux_386")

md5sums_i686=('e3aa5161485cdb3dbd5bbfe184be85b8')

package() {
  install -Dm755 "${pkgname/-bin/}_linux_386" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
