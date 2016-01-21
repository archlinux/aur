# Maintainer: Konstantin Gribov <grossws at gmail dot com>
# Contributor: Sebastian Krebs <sebastian at krebs dot one>

pkgname=consul
pkgver=0.6.3
pkgrel=1
pkgdesc='Service discovery and high-available (CP) KV storage'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://www.consul.io/'
license=('custom:MPLv2')
depends=('glibc')
source_x86_64=("https://releases.hashicorp.com/${pkgname}/${pkgver}/${pkgname}_${pkgver}_linux_amd64.zip")
source_i686=("https://releases.hashicorp.com/${pkgname}/${pkgver}/${pkgname}_${pkgver}_linux_386.zip")
source_armv6h=("https://releases.hashicorp.com/${pkgname}/${pkgver}/${pkgname}_${pkgver}_linux_arm.zip")
source_armv7h=("https://releases.hashicorp.com/${pkgname}/${pkgver}/${pkgname}_${pkgver}_linux_arm.zip")
source=("https://raw.githubusercontent.com/hashicorp/${pkgname}/v${pkgver}/LICENSE")
sha256sums=('bef1747eda88b9ed46e94830b0d978c3499dad5dfe38d364971760881901dadd')
sha256sums_i686=('2afb65383ab913344daaa9af827c1e8576c7cae16e93798048122929b6e4cc92')
sha256sums_x86_64=('b0532c61fec4a4f6d130c893fd8954ec007a6ad93effbe283a39224ed237e250')
sha256sums_armv6h=('c5fd5278be2757d2468bc7e263af15bc9a9e80fc5108fec658755804ea9bca56')
sha256sums_armv7h=('c5fd5278be2757d2468bc7e263af15bc9a9e80fc5108fec658755804ea9bca56')

package() {
  install -m755 -D consul "$pkgdir/usr/bin/consul"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/consul/LICENSE"
}

# vim:set ts=2 sw=2 et:

