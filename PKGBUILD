# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=librewolf-extension-localcdn
pkgver=2.6.45
pkgrel=1
pkgdesc='LocalCDN addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/de/firefox/addon/localcdn-fork-of-decentraleyes/'
license=('GPLV3')
groups=('librewolf-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/4059496/localcdn_fork_of_decentraleyes-${pkgver}.xpi")
md5sums=('257cd26c668fa1f50233dcade06bade6')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/librewolf/browser/extensions/{b86e4813-687a-43e6-ab65-0bde4ab75758}.xpi"
}
