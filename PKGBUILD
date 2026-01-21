# Maintainer: Marco33
pkgname=ggjj
pkgver=0.37.2
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('ec9cf071bd002de4660a3d909120599f2f2a0cec18ef6a2d6d225b9b5b8cb7f4')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}

