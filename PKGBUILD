# Maintainer: TrueWarg irrmm9000@gmail.com
pkgname=vorbild
pkgver=1.1.0
pkgrel=2
pkgdesc="Generate files from templates"
arch=('i686' 'x86_64')
url="https://github.com/TrueWarg/vorbild"
license=('Apache')
groups=()
depends=('gmp')
makedepends=()
optdepends=()
source=("https://github.com/TrueWarg/vorbild/releases/download/v$pkgver/linux_$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('c18be0719ad8c7af913b67299efdb5ff8f5dcc5011df41caea3ca0ada2e4192f')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "$srcdir/${pkgname}-${pkgver}/vorbild" "${pkgdir}/usr/bin/vorbild"
  chmod +x "${pkgdir}/usr/bin/vorbild"
}
