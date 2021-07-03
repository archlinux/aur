# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=librewolf-extension-xdm-browser-monitor
pkgver=2.2
pkgrel=1
pkgdesc='XDM browser monitor addon for Librewolf'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/xdm-browser-monitor/'
license=('GPLV3')
depends=('xdman')
groups=('librewolf-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3710348/xdm_browser_monitor-${pkgver}-fx.xpi")
noextract=("extension.xpi")
sha512sums=('SKIP')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/librewolf/browser/extensions/browser-mon@xdman.sourceforge.net.xpi"
}
