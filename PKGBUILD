# Maintainer: John D Jones III jnbek1972 __AT__ $mailservice_provided_by_google __DOT__ com

_npmname=irccloud-cli
pkgname=nodejs-$_npmname
pkgver=0.2.2
pkgrel=1
pkgdesc="irccloud commandline interface"
arch=(any)
url="https://github.com/yhsiang/irccloud-cli"
license=('MIT')
depends=('nodejs' 'nodejs-livescript')
makedepends=('nodejs' 'npm')
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
md5sums=('f9dcd997b1d56cd8ffc78463d4858539')

package() {
  cd "$srcdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"
}

# vim:set ts=2 sw=2 et:
