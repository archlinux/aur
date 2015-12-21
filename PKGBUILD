# Maintainer: Konstantin Gribov <grossws at gmail dot com>

_pkgname=serf
pkgname=${_pkgname}-cluster
pkgver=0.7.0
pkgrel=1
pkgdesc='Decentralized cluster membership, failure detection and orchestration util'
arch=('i686' 'x86_64')
url='https://www.serfdom.io/'
license=('custom:MPLv2')
depends=('glibc')
source_x86_64=("https://releases.hashicorp.com/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("https://releases.hashicorp.com/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source=("https://raw.githubusercontent.com/hashicorp/${_pkgname}/v${pkgver}/LICENSE")
sha256sums_x86_64=('b239fdcd1c15fd926ff0cd10bc32a31330d1c74aba9e4d49ff83d5707ef1ba4b')
sha256sums_i686=('50c748494473d647ee81791c89a9f8032cc292f6b617781234658a6868f9db13')
sha256sums=('bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd')

package() {
  install -m755 -D serf "$pkgdir/usr/bin/serf"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

