# Maintainer: ParaSait <parasait at proton dot me>
pkgname=json-ld-cli-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='A simple command line utility allowing to process JSON-LD 1.1 documents.'
arch=('any')
url='https://github.com/filip26/json-ld-cli'
license=('Apache')
source=("${url}/releases/download/v${pkgver}/json-ld-cli-${pkgver}-ubuntu-latest.zip")
sha256sums=('57fc2d98cec3e2a8c0d6270aa078e93b5bf36f53093af10365906922c4c138a0')

package() {
  install -Dm 755 "jsonld" "$pkgdir/usr/bin/jsonld"
}
