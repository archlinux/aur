#Maintainer: Julius Härtl <jus@bitgrid.net>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=krankerl-bin
pkgver=0.13.3
pkgrel=1
pkgdesc="A CLI helper to manage, package and publish Nextcloud apps"
url="https://github.com/ChristophWurst/krankerl"
arch=('x86_64')
license=('GPL-3.0')
depends=('libcurl-gnutls')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}::https://github.com/ChristophWurst/krankerl/releases/download/v${pkgver}/krankerl")
sha256sums=('7c76e79c677e97107e18c1352f704a0357140c772eb47c2b0f28effd66232f42')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/krankerl"
}

