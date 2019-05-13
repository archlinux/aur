# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=zapier-platform-cli
pkgver=8.1.0
pkgrel=1
pkgdesc="This CLI is your gateway to creating custom applications on the Zapier platform"
arch=('x86_64')
url="https://zapier.github.io/zapier-platform-cli/cli"
license=('UNLICENSED')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('0c0d34b43b8937879ff7f9bdcd17a6b89243375f30b8d04ae3858824a80e53d5')
noextract=("$pkgname-$pkgver.tgz")
options=('!strip')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" $noextract
}
