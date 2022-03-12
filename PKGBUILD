# Maintainer: TrueWarg irrmm9000@gmail.com
pkgname=vorbild
pkgver=1.0.0
pkgrel=1
pkgdesc="Files generation from templates"
arch=('i686' 'x86_64')
url="https://github.com/TrueWarg/vorbild"
license=('Apache')
groups=()
depends=('gmp')
makedepends=()
optdepends=()
source=("https://github.com/TrueWarg/vorbild/releases/download/v$pkgver/linux_$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('dfd7cf030934d1214e966dc4c8727a1322eb9eff45ba7986991617e607648f3b')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "$srcdir/${pkgname}-${pkgver}/vorbild" "${pkgdir}/usr/bin/vorbild"
  chmod +x "${pkgdir}/usr/bin/vorbild"
}
