# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=12
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('1a95931bdc3a2e8c71d41481c8562b01c4f834b905d9e5812a40748ee94ed2f0')
sha256sums_x86_64=('9ece536b2a500ba7ca829217013363f5cd511f844f7d08c932ad0569f61cddc6')
sha256sums_armv7h=('3481c8599be967f57a971d7609aee086848bd4d782597b9b7a46f1789930238a')
provides=('lf')
conflicts=('lf')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
