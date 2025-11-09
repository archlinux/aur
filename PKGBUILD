# Maintainer: Stanislav Berezhnoy <me@pwrshi.ru>
pkgname=puro-bin
pkgver=1.4.11
pkgrel=1
pkgdesc='A powerful tool for installing and upgrading Flutter versions.'
url='https://github.com/pingbird/puro'
source=("$pkgname-$pkgver::https://puro.dev/builds/$pkgver/linux-x64/puro")
arch=('x86_64')
options=('!strip' '!debug')
license=('GPL-3.0-or-later')
depends=('git')
conflicts=('puro')
provides=('puro')
sha256sums=('be0e79875f30e2c9f48db20adb5443e02ec78068885c30f1a698513205b2668a')

package() {
  install -Dm755 "$srcdir/puro-bin-$pkgver" "$pkgdir/usr/bin/puro"
}
