# Maintainer: orhun <orhunparmaksiz@gmail.com>
pkgname=kmon-bin
pkgver=v0.1.0
pkgrel=1
pkgdesc="Linux kernel manager and activity monitor"
arch=('x86_64')
url="https://github.com/orhun/kmon"
license=('GPL3')
depends=('libxcb')
makedepends=('cargo' 'git')
provides=("$pkgname")
conflicts=("$pkgname" "${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/orhun/${pkgname%-bin}/releases/download/$pkgver/${pkgname%-bin}-${pkgver#v}.tar.gz")
sha256sums=('4162894077d31ea000d18ae501adbd62e87835f584ae2d1f1fb4e849926e7bdf')

package() {
  install -Dt "$pkgdir/usr/bin/" "$srcdir/kmon"
}