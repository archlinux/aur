# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=13
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('136fcd460156bef96a7a4b88bca0c607c6b4c341a082cf1e8a68092a6292f8e8')
sha256sums_x86_64=('260aaedf290fc21b2161555d35d968d4defbc667acfaba43c6616e8e6933c921')
sha256sums_armv7h=('2f81a457a4aa1f2922c8e21bdab986d240c856e93ac6abb91a139e58c21c1289')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
