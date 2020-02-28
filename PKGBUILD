# Maintainer: j605

_pkgname=sccache
pkgname=$_pkgname-bin
pkgver=0.2.13
pkgrel=1
pkgdesc="ccache-like tool with experimental rust support"
arch=("x86_64")
url="https://github.com/mozilla/sccache"
license=("Apache")
provides=("sccache")
conflicts=("sccache")
source=("https://github.com/mozilla/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-$CARCH-unknown-linux-musl.tar.gz")

package() {
  cd "sccache-$pkgver-$CARCH-unknown-linux-musl"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 755 sccache "${pkgdir}/usr/bin/sccache"
}
md5sums=('e668ba324a0d279d377c5f23dc06fd39')
