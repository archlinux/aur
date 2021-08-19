#Maintainer: Julius Härtl <jus@bitgrid.net>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=krankerl-bin
pkgver=0.13.1
pkgrel=1
pkgdesc="A CLI helper to manage, package and publish Nextcloud apps"
url="https://github.com/ChristophWurst/krankerl"
arch=('x86_64')
license=('GPL-3.0')
depends=('libcurl-gnutls')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}::https://github.com/ChristophWurst/krankerl/releases/download/v${pkgver}/krankerl")
sha256sums=('eeb9bf382622390693bf05bf62a479effdd791a0e2c429c6cdae427b032e64a9')

package() {
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/krankerl"
}

