# Maintainer: timescam <rex.ky.ng at gmail dot com>
pkgname=zentile-bin
pkgver=0.1.1
pkgrel=2
pkgdesc="Automatic Tiling for EWMH Complaint Window Managers. Pre-compiled."
arch=('x86_64')
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
  'bin32-zentile'
  'zentile-git'
  )

source_x86_64=("https://github.com/blrsn/zentile/releases/download/v${pkgver}/${pkgname/-bin/}_linux_amd64")

md5sums_x86_64=('a3fe78afeb7b08650c7f09386378b6e7')

package() {
  install -Dm755 "${pkgname/-bin/}_linux_amd64" "${pkgdir}/usr/bin/${pkgname/-bin/}"
}
