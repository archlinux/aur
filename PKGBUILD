# Maintainer: Konstantin Gribov <grossws at gmail dot com>

pkgname=consul
pkgver=0.5.2
pkgrel=2
pkgdesc='Service discovery and high-available (CP) KV storage'
arch=('x86_64')
url='https://www.consul.io/'
license=('custom:MPLv2')
depends=('glibc')
source=("https://dl.bintray.com/mitchellh/${pkgname}/${pkgver}_linux_amd64.zip"
        "LICENSE")
sha256sums=('171cf4074bfca3b1e46112105738985783f19c47f4408377241b868affa9d445'
            'bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd')

package() {
  install -m755 -D consul "$pkgdir/usr/bin/consul"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/consul/LICENSE"
}

# vim:set ts=2 sw=2 et:

