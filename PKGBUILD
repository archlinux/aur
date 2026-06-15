# Maintainer: Amaan Hashmi-Ubhi <amaanhub at protonmail dot com>
# Contributor: matoro <matoro at airmail.cc>
# Contributor: Max Gautier <mg+archlinux@max.gautier.name>

pkgname=nodejs-resume-cli
pkgver=3.7.1
pkgrel=1
pkgdesc="The command line tool for JSON Resume"
arch=(any)
url="https://github.com/jsonresume/jsonresume.org/tree/master/packages/cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${pkgname:7}/-/${pkgname:7}-${pkgver}.tgz")
noextract=(${pkgname}-${pkgver}.tgz)
sha512sums=('f37c0f9c55a2e34c0fe860362bbff75ec7f859a23656dc27b48ec72694a77644aeb3078ae781c58951192b0bd64be0cdd146ffbddd864eab21512777d8e852e1')

package() {
   npm install -g --omit=dev --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
}
