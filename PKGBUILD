# Maintainer: Malachi Soord <me@malachisoord.com>
# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=deployer
pkgver=7.4.0
_target_version=${pkgver//_/-}
pkgrel=1
pkgdesc="A deployment tool written in PHP with support for popular frameworks out of the box."
arch=('any')
url="https://deployer.org"
license=('MIT')
depends=('php')
source=("$pkgname-$_target_version.phar::https://github.com/deployphp/deployer/releases/download/v$_target_version/deployer.phar")
sha512sums=('06672fcd93f032ac45c72767cc64dc6b79515cf6710d57f5366c6c2b74334abb34031f23ea8020b8943621569af339d2d6947a879afc2287330dc789662c6d3c')

package() {
    install -Dm0755 ${srcdir}/$pkgname-$_target_version.phar "$pkgdir/usr/local/bin/dep"
}
