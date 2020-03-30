pkgname=firefox-extension-xdm-browser-monitor
pkgver=2.1
pkgrel=1
pkgdesc='xdm browser monitor addon for firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/xdm-browser-monitor/'
license=('GPLV3')
depends=('firefox' 'xdman')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/1089149/xdm_browser_monitor-${pkgver}-fx.xpi")
noextract=("extension.xpi")
sha512sums=('50b74f6cf819717d96378778bebee763c7c2837f64e3b4877f276168884bf25330b6649c03585bd4386134fdb6f4b4015b4693e6334e4fe3c1f25896a5808065')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/browser-mon@xdman.sourceforge.net.xpi"
}
