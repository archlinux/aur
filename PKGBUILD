# Maintainer: Marco33
pkgname=ggjj
pkgver=0.39.1
pkgrel=1
pkgdesc="GG - Gui for JJ"
arch=('x86_64')
url="https://github.com/gulbanana/gg"
license=('APACHE')
source=("https://github.com/gulbanana/gg/releases/download/v${pkgver}/gg_${pkgver}_amd64.deb")
sha256sums=('11c7697e7c3d97cd8068d3db7d3a3d05b2718254ec46914b4b78c5571ca33669')

package() {
  bsdtar -zxf "$srcdir/data.tar.gz" -C "$pkgdir"
}

