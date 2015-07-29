# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname=please
pkgver=0.4.1
pkgrel=1
pkgdesc="A command line utility that makes it easy to integrate web services into your shell scripts"
arch=('i686' 'x86_64')
url=""
license=('MIT')
install=
changelog=
source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums_i686=('39bf1a009c3a964c8bd48605cafe39c2')
md5sums_x86_64=('d901396770aea8374e01bc71ca668b99')
source=()
source_i686=("please-i686::https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/$pkgname-linux-i386")
source_x86_64=("please-x86_64::https://github.com/stilvoid/$pkgname/releases/download/v$pkgver/$pkgname-linux-amd64")

package() {
  install -Dm 755 "${srcdir}/please-$CARCH" "${pkgdir}/usr/bin/please"
}
