# Maintainer: Malachi Soord <me@malachisoord.com>
# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=deployer
<<<<<<< HEAD
pkgver=7.2.1
=======
pkgver=7.3.1
>>>>>>> 7dbd7f6 (Upgrade to 7.3.1)
_target_version=${pkgver//_/-}
pkgrel=1
pkgdesc="A deployment tool written in PHP with support for popular frameworks out of the box."
arch=('any')
url="https://deployer.org"
license=('MIT')
depends=('php')
source=("$pkgname-$_target_version.phar::https://github.com/deployphp/deployer/releases/download/v$_target_version/deployer.phar")
<<<<<<< HEAD
sha512sums=('a9e63d1812323965a41de8a43a99ac8afdb5f1e70971dd8650789f399d62c8237ec2165321139f6205aac6a4f7f0d9eed82213c4d621245f0ebbe493cd1ea9ae')
=======
sha512sums=('4ee7417fbf9ad16a1da8aba3f2a7c0385bc72f8e0b66054be92240eab666e265f3b2c2472bd76486f22b72cb8bb29c72db82e5e7ab5d4e1e2b73dc2af20eceb1')
>>>>>>> 7dbd7f6 (Upgrade to 7.3.1)

package() {
    install -Dm0755 ${srcdir}/$pkgname-$_target_version.phar "$pkgdir/usr/local/bin/dep"
}
