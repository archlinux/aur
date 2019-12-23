# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=gactions
pkgver=2.2.4
pkgrel=1
pkgdesc="The command line interface that you use to test and update your app for the Google Assistant."
arch=('x86_64')
url="https://developers.google.com/actions/tools/gactions-cli"
source=($pkgname::https://dl.google.com/gactions/updates/bin_linux_amd64_${pkgver}_dev.bin)
md5sums=('d315c973ceeca610d131027c1f573570')

build() {
  chmod +x $pkgname
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $pkgname $pkgdir/usr/bin/$pkgname
}
