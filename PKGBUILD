# Maintainer: Malachi Soord <me@malachisoord.com>
# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=deployer
pkgver=6.8.0
pkgrel=1
pkgdesc="A deployment tool written in PHP with support for popular frameworks out of the box."
arch=('any')
url="https://deployer.org"
license=('MIT')
depends=('php')
source=("https://deployer.org/releases/v$pkgver/deployer.phar")
sha1sums=('18270e46dd02bcac871cf0babee82702457a26b0')

package() {
    install -Dm0755 ${srcdir}/deployer.phar "$pkgdir/usr/local/bin/dep"
}
