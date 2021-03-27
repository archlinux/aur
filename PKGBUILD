# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>
pkgname=firefox-extension-localcdn
pkgver=2.6.3
pkgrel=1
pkgdesc='LocalCDN addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/de/firefox/addon/localcdn-fork-of-decentraleyes/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3678357/localcdn-${pkgver}-an+fx.xpi")
md5sums=('d585a0d1d95f7324049ebfdacd6f765e')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi"
}
