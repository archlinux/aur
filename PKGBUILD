# Maintainer: Konstantin Gribov <grossws at gmail dot com>

_pkgname=serf
pkgname=${_pkgname}-cluster
pkgver=0.6.4
pkgrel=2
pkgdesc='Decentralized cluster membership, failure detection and orchestration util'
arch=('i686' 'x86_64')
url='https://www.serfdom.io/'
license=('custom:MPLv2')
depends=('glibc')
source_x86_64=("https://dl.bintray.com/mitchellh/${_pkgname}/${pkgver}_linux_amd64.zip")
source_i686=("https://dl.bintray.com/mitchellh/${_pkgname}/${pkgver}_linux_386.zip")
source=("https://raw.githubusercontent.com/hashicorp/${_pkgname}/v${pkgver}/LICENSE")
sha256sums_x86_64=('bdb2a60a37fbb46c1a498bbb1354e34c1951e3c5df8003b95f9d4019c4e37663')
sha256sums_i686=('841aac4dc60c31c89ea6ca1f5baba139e99982fabb8bbabdf061e429b8cac939')
sha256sums=('bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd')

package() {
  install -m755 -D serf "$pkgdir/usr/bin/serf"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

