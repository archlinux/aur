# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname=please
pkgver=0.5
pkgrel=1
pkgdesc="A command line utility that makes it easy to integrate web services into your shell scripts"
arch=('i686' 'x86_64')
url=""
license=('MIT')
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums_i686=('2b04f8fc873ffa4d8e79d38f81e1180b')
md5sums_x86_64=('e67ff59da4c4207e32e83329bddc418d')
source=()
source_i686=("please-i686::https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/$pkgname-linux-i386")
source_x86_64=("please-x86_64::https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64")

package() {
  install -Dm 755 "${srcdir}/please-$CARCH" "${pkgdir}/usr/bin/please"
}
