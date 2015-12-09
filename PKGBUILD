# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=consul
pkgver=0.6.0
pkgrel=1
pkgdesc='Service discovery and high-available (CP) KV storage'
arch=('i686' 'x86_64')
url='https://www.consul.io/'
license=('custom:MPLv2')
depends=('glibc')
source_x86_64=("https://releases.hashicorp.com/${pkgname}/${pkgver}/${pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("https://releases.hashicorp.com/${pkgname}/${pkgver}/${pkgname}_${pkgver}_linux_386.zip")
source=("https://raw.githubusercontent.com/hashicorp/${pkgname}/v${pkgver}/LICENSE")
sha256sums_x86_64=('307fa26ae32cb8732aed2b3320ed8daf02c28b50d952cbaae8faf67c79f78847')
sha256sums_i686=('f58f3f03a8b48d89bb8be94a6d1767393ad2a410c920b064066e01c7fa24f06c')
sha256sums=('bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd')

package() {
  install -m755 -D consul "$pkgdir/usr/bin/consul"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/consul/LICENSE"
}

# vim:set ts=2 sw=2 et:

