# Maintainer: Malachi Soord <me@malachisoord.com>
# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=deployer
pkgver=7.0.2
_target_version=${pkgver//_/-}
pkgrel=1
pkgdesc="A deployment tool written in PHP with support for popular frameworks out of the box."
arch=('any')
url="https://deployer.org"
license=('MIT')
depends=('php')
source=("$pkgname-$_target_version.phar::https://github.com/deployphp/deployer/releases/download/v$_target_version/deployer.phar")
sha512sums=('91aace99608b199fe32e4d124401eefd4283afb9cffb10928c970997a45e842a921737a93c81deb975786818bbcb41de0b33f2a7f2be368d214e0b7516bb046c')

package() {
    install -Dm0755 ${srcdir}/$pkgname-$_target_version.phar "$pkgdir/usr/local/bin/dep"
}
