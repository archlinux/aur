# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname=please
pkgver=0.4.0
pkgrel=1
pkgdesc="A command line utility that makes it easy to integrate web services into your shell scripts"
arch=('i686' 'x86_64')
url=""
license=('MIT')
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums_i686=('695e5519ef51e469cc65110adc4b07ec')
md5sums_x86_64=('a39af638db0660adb5c86d0eb3a9e810')
source=()
source_i686=("please-i686::https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/$pkgname-linux-i386")
source_x86_64=("please-x86_64::https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64")

package() {
  install -Dm 755 "${srcdir}/please-$CARCH" "${pkgdir}/usr/bin/please"
}
