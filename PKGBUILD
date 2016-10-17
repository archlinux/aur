# Maintainer: Konstantin Gribov <grossws at gmail dot com>

_pkgname=serf
pkgname=${_pkgname}-cluster
pkgver=0.8.0
pkgrel=1
pkgdesc='Decentralized cluster membership, failure detection and orchestration util'
arch=('i686' 'x86_64')
url='https://www.serfdom.io/'
license=('custom:MPLv2')
depends=('glibc')
source_x86_64=("https://releases.hashicorp.com/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("https://releases.hashicorp.com/${_pkgname}/${pkgver}/${_pkgname}_${pkgver}_linux_386.zip")
source=("https://raw.githubusercontent.com/hashicorp/${_pkgname}/v${pkgver}/LICENSE")
sha256sums_x86_64=('67620e000fea28c3755e21d475a97fd65ad397df02c60c0e801ae2d521587b77')
sha256sums_i686=('562f2a3c1dc4d1d55d1d37a44a6169311e54059489fadabba384dd0faf75d266')
sha256sums=('bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd')

package() {
  install -m755 -D serf "$pkgdir/usr/bin/serf"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

