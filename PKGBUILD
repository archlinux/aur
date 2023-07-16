# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=librewolf-extension-xdman8-browser-monitor
pkgname=$_pkgname-bin
pkgver=3.4
pkgrel=1
pkgdesc='Download files with XDM v8+ (binary release)'
url="https://addons.mozilla.org/addon/xdm-browser-monitor-v8"
arch=('any')
license=('GPL3')
depends=('librewolf' 'xdman8')
provides=("$_pkgname")
groups=('librewolf-addons')
noextract=(xdm_browser_monitor_v8-$pkgver.xpi)
source=("https://addons.mozilla.org/firefox/downloads/file/4095144/xdm_browser_monitor_v8-$pkgver.xpi")
sha256sums=('fb703ac17dc239600389a86953fbf63df6d31280a7745147c11cba932d1657c9')

package() {
  install -Dm644 xdm_browser_monitor_v8-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/xdm-v8-browser-helper@subhra74.github.io.xpi"
}
