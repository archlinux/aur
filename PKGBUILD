# Maintainer: Konstantin Gribov <grossws at gmail dot com>

_pkgname=serf
pkgname=${_pkgname}-cluster
pkgver=0.8.1
pkgrel=1
pkgdesc='Decentralized cluster membership, failure detection and orchestration util'
arch=('i686' 'x86_64')
url='https://www.serfdom.io/'
license=('custom:MPLv2')
depends=('glibc')
source_x86_64=("https://releases.hashicorp.com/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("https://releases.hashicorp.com/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source=("https://raw.githubusercontent.com/hashicorp/${_pkgname}/v${pkgver}/LICENSE")
sha256sums=('bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd')
sha256sums_i686=('4939385ea257eaded9176bbb8817894d3bce1b1141dc6cdb0e4085ad10a6c156')
sha256sums_x86_64=('b42b7866a7584adf6e755b42711cd0234993cb9347062a27e494280a434f32bf')

package() {
  install -m755 -D serf "$pkgdir/usr/bin/serf"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

