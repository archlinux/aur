# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firefox-extension-localcdn
pkgver=2.6.32
pkgrel=1
pkgdesc='LocalCDN addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/de/firefox/addon/localcdn-fork-of-decentraleyes/'
license=('GPLV3')
depends=('firefox')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3985626/localcdn_fork_of_decentraleyes-${pkgver}.xpi")
md5sums=('5fab6efe545e79b93bac891076a5907b')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi"
}
