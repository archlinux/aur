pkgname=firedragon-extension-xdm-browser-monitor
pkgver=2.2
pkgrel=1
pkgdesc='xdm browser monitor addon for firedragon.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/xdm-browser-monitor/'
license=('GPLV3')
depends=('firedragon' 'xdman')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3710348/xdm_browser_monitor-${pkgver}-fx.xpi")
noextract=("extension.xpi")
sha512sums=('01474baed42169638475f6f612d022efb0e83026e9ef5ab1e6b91aa6884f58b84ad819aa3d38c64cd675e07cd48a2aa48dae3b3c07319ad115097dcae15e0b42')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/browser-mon@xdman.sourceforge.net.xpi"
}
