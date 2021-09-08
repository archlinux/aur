# Maintainer: Javier Domingo Cansino <javierdo1 at gmail dot com>

pkgname=pixielabs-pixie-px
pkgver=0.5.2
pkgrel=2
pkgdesc='px cli from pixielabs.ai pixie'
arch=('x86_64')
url='https://docs.pixielabs.ai/installing-pixie/install-schemes/cli/'
license=('unkown')
# options=('!strip')

source=("https://storage.googleapis.com/pixie-prod-artifacts/cli/latest/pixie-px.x86_64.deb")
sha256sums=('ff1a66e1a3f68288f583bd043b49c11de3975bb8bf4bd7fb86fd72077686370c')

prepare() {
  bsdtar -xf data.tar.gz
}

package() {
  install -D ./usr/local/bin/px -t "${pkgdir}/usr/bin"
}

