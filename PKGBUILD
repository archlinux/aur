# Maintainer: Javier Domingo Cansino <javierdo1 at gmail dot com>

pkgname=pixielabs-pixie-px
pkgver=0.7.17
pkgrel=1
pkgdesc='px cli from pixielabs.ai pixie'
arch=('x86_64')
url='https://docs.pixielabs.ai/installing-pixie/install-schemes/cli/'
license=('unkown')
# options=('!strip')

source=("https://storage.googleapis.com/pixie-dev-public/cli/latest/pixie-px.x86_64.deb")
sha256sums=('fac02a6351c0ac039c4c412f5cb04c59970b6cec5762b426785a65e3e7691b4a')

prepare() {
  bsdtar -xf data.tar.gz
}

package() {
  install -D ./usr/local/bin/px -t "${pkgdir}/usr/bin"
}

