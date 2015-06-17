# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=consul
pkgver=0.5.2
pkgrel=3
pkgdesc='Service discovery and high-available (CP) KV storage'
arch=('i686' 'x86_64')
url='https://www.consul.io/'
license=('custom:MPLv2')
depends=('glibc')
source_x86_64=("https://dl.bintray.com/mitchellh/${pkgname}/${pkgver}_linux_amd64.zip")
source_i686=("https://dl.bintray.com/mitchellh/${pkgname}/${pkgver}_linux_386.zip")
source=("https://raw.githubusercontent.com/hashicorp/${pkgname}/v${pkgver}/LICENSE")
sha256sums_x86_64=('171cf4074bfca3b1e46112105738985783f19c47f4408377241b868affa9d445')
sha256sums_i686=('29306ce398109f954ceeea3af79878be4fb0d949f8af3a27c95ccef2101e8f60')
sha256sums=('bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd')

package() {
  install -m755 -D consul "$pkgdir/usr/bin/consul"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/consul/LICENSE"
}

# vim:set ts=2 sw=2 et:

