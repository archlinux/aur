# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=gactions
pkgver=2.1.2
pkgrel=1
pkgdesc="The command line interface that you use to test and update your app for the Google Assistant."
arch=('x86_64')
url="https://developers.google.com/actions/tools/gactions-cli"
source=($pkgname::https://dl.google.com/gactions/updates/bin/linux/amd64/gactions/gactions)
md5sums=('dadddbf3b7100cbc329231061e055ed9')

build() {
  chmod +x $pkgname
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m 0755 $pkgname $pkgdir/usr/bin/$pkgname
}
