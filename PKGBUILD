# Maintainer: Malachi Soord <me@malachisoord.com>
# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=deployer
pkgver=7.5.12
_target_version=${pkgver//_/-}
pkgrel=1
pkgdesc="A deployment tool written in PHP with support for popular frameworks out of the box."
arch=('any')
url="https://deployer.org"
license=('MIT')
depends=('php')
source=("$pkgname-$_target_version.phar::https://github.com/deployphp/deployer/releases/download/v$_target_version/deployer.phar")
sha512sums=('d2d110249ecea6624ec1122648cba1b2244a623c09ec02ee61d32e765e06f5e85a88191ae87371a7d5bd66aca6be0704fa3bbd07ff708fd33aeeeea26ff5112b')

package() {
    install -Dm0755 ${srcdir}/$pkgname-$_target_version.phar "$pkgdir/usr/local/bin/dep"
}
