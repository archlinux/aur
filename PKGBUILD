# Maintainer: Konstantin Gribov <grossws at gmail dot com>
# Contributor: Sebastian Krebs <sebastian at krebs dot one>

pkgname=consul
pkgver=0.6.1
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
sha256sums_i686=('34b8d4a2a9ec85082b6e93c6785ba9c54663fec414062e45dd4386db46a533c4')
sha256sums_x86_64=('dbb3c348fdb7cdfc03e5617956b243c594a399733afee323e69ef664cdadb1ac')
sha256sums_armv6h=('5b61e9ed10e02990aa8a2a0116c398c61608bc7f5051cb5a13750ffd47a54d51')
sha256sums_armv7h=('5b61e9ed10e02990aa8a2a0116c398c61608bc7f5051cb5a13750ffd47a54d51')

package() {
  install -m755 -D consul "$pkgdir/usr/bin/consul"
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/consul/LICENSE"
}

# vim:set ts=2 sw=2 et:

