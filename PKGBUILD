# Maintainer: darkelectron <darkelectron(dot)aur(at)tutanota.com
# Contributor: Aoibhinn Nic Aoidh <oibind@pm.me>
# Contributor: Dany Marcoux <danymarcoux+archlinux@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=lf-bin
pkgver=28
pkgrel=1
pkgdesc='A terminal file manager inspired by ranger (Precompiled binary from official repository)'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/gokcehan/lf'
license=('MIT') # https://github.com/gokcehan/lf/blob/master/LICENSE
options=('!strip' '!emptydirs')
source_i686=("lf-$pkgver-linux-386.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-386.tar.gz")
source_x86_64=("lf-$pkgver-linux-amd64.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-amd64.tar.gz")
source_armv7h=("lf-$pkgver.linux-arm.tar.gz::${url}/releases/download/r${pkgver}/lf-linux-arm.tar.gz")
sha256sums_i686=('33cb113e8aabd97241165f707305e6339fc2c38f0a67e6f412216d41b1535ef9')
sha256sums_x86_64=('4ef583838437fe1f4a3dcec78c96679c6b79e2e5405432efe9baa7ee341746c5')
sha256sums_armv7h=('236422b23952b1e5cbacde04a65b8cf888e3eec8a4a7f64b94a9f838aa3ab2b4')
provides=('lf')
conflicts=('lf' 'lf-git' 'lf-sixel-git')

package() {
  install -Dm755 "lf" "$pkgdir/usr/bin/lf"
}
