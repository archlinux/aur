# Maintainer: Konstantin Gribov <grossws at gmail dot com>

_pkgname=serf
pkgname=${_pkgname}-cluster
pkgver=0.8.2
pkgrel=1
pkgdesc='Decentralized cluster membership, failure detection and orchestration util'
arch=('i686' 'x86_64')
url='https://www.serf.io/'
license=('custom:MPLv2')
depends=('glibc')
source_x86_64=("https://releases.hashicorp.com/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("https://releases.hashicorp.com/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source=("https://raw.githubusercontent.com/hashicorp/${_pkgname}/v${pkgver}/LICENSE")
sha256sums=('bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd')
sha256sums_i686=('1022fec7b0a1e0feda0d733e53f38a1214181e7d57189acd746cd95e92d4a1fb')
sha256sums_x86_64=('1977efc7ed44749e1ae6a0f9b4efca3024932187d83eb61de00ba19fd8146596')

package() {
  install -m755 -D serf "$pkgdir/usr/bin/serf"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

