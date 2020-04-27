pkgname=firefox-extension-gnome-shell-integration
pkgver=10.1
pkgrel=1
pkgdesc='gnome shell integration addon for firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/'
license=('GPLV3')
depends=('firefox' 'chrome-gnome-shell')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/898030/gnome_shell_integration-${pkgver}-an+fx-linux.xpi")
sha512sums=('91b7230718f3cfdb107d29b4ded342b2d27c439b3422c546d6f990fadc6b418d293301f22f6403239166998f7b41516c2969a5f9c975e8609dfa867049f09267')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/chrome-gnome-shell@gnome.org.xpi"
}
