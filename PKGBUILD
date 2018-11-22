# Maintainer: Ivaylo Kirilov <iikirilov@gmail.com>
pkgname=pantheon
pkgver=0.8.2
pkgrel=1
pkgdesc='Pantheon is an Apache 2.0 licensed, MainNet compatible, Ethereum client written in Java.'
arch=('any')
url='https://pegasys.tech/'
license=('Apache')
depends=('java-runtime>=8')
source=("https://bintray.com/consensys/pegasys-repo/download_file?file_path=pantheon-0.8.2.zip")
package() {
  cd "$pkgname-$pkgver"
  install -D -m644 -t "$pkgdir/usr/share/java/pantheon" lib/*
  install -D -m755 "$srcdir/pantheon"  "$pkgdir/usr/bin/pantheon"
}