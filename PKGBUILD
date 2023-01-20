# Maintainer: pjvds <pj@born2code.net>
_npmname=cdk-dia
_npmver=0.9.0
pkgname=cdk-dia
pkgver="${_npmver}"
pkgrel=1
pkgdesc="Cdk-dia diagrams your CDK provisioned infrastructure using the Graphviz dot language."
arch=('any')
url="https://www.npmjs.com/package/cdk-dia"
depends=('nodejs' 'graphviz')
makedepends=('npm')
source=("${_npmname}-${_npmver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('d969ab73b8219593b5a02981ae81bc2bbfc67c85f98c4add9f1d02f9217a5f2b')

package() {
  npm install --production -g --cache "$srcdir/cdk-dia" --prefix "$pkgdir/usr" "${_npmname}-${_npmver}.tgz"
  chown -R root:root "$pkgdir"
}
