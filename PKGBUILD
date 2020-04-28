# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
_npmname=aws-cdk
pkgname=nodejs-aws-cdk
pkgver=1.36.0
pkgrel=1
pkgdesc="CDK Toolkit, the command line tool for CDK apps"
arch=(any)
url="https://github.com/awslabs/aws-cdk#readme"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
optdepends=('python: python language support')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=('dccbc86014310ed0990a7111768c4d79ec96c1a9')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

# vim:set ts=2 sw=2 et:
