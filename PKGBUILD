# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=wowlet-bin
_pkg=wowlet
pkgver=4.1.0
pkgrel=2
pkgdesc="A free Wownero desktop wallet"
url="https://git.wownero.com"
arch=('x86_64')
license=('custom')
provides=("${_pkg}")
conflicts=("${_pkg}")
source=("$_pkg-v$pkgver-$arch-linux.zip::$url/attachments/5422f119-6fc2-4123-85de-0acc84421aba")
sha512sums=('be21d0a8a02481cebcc516190eaace004d4c39a48be892868f55dc1a675861cb8c00c3fbf08b2a5c31ae15cea36fed92b252e1aec087cf2b9c3fb0f5a8df7184')

package() {
  install -Dm755 "${srcdir}/$_pkg" "$pkgdir/opt/${_pkg}/$_pkg"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/$_pkg "${pkgdir}/usr/bin"
}
