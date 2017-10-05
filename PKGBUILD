# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=gactions
pkgver=1
pkgrel=1
pkgdesc="The command line interface that you use to test and update your app for the Google Assistant."
arch=('x86_64')
url="https://developers.google.com/actions/tools/gactions-cli"
source=($pkgname::https://dl.google.com/gactions/updates/bin/linux/amd64/gactions/gactions)
md5sums=('fbcf827a7c528c1cdc1ce9878b2c3366')

build() {
  chmod +x $pkgname
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $pkgname $pkgdir/usr/bin/$pkgname
}
