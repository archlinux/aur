pkgname=librewolf-extension-gnome-shell-integration
pkgver=10.1
pkgrel=1
pkgdesc='GNOME shell integration addon for Librewolf'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/'
license=('GPLV3')
depends=('librewolf' 'chrome-gnome-shell')
groups=('librewolf-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/898030/gnome_shell_integration-${pkgver}-an+fx-linux.xpi")
sha512sums=('91b7230718f3cfdb107d29b4ded342b2d27c439b3422c546d6f990fadc6b418d293301f22f6403239166998f7b41516c2969a5f9c975e8609dfa867049f09267')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/librewolf/browser/extensions/chrome-gnome-shell@gnome.org.xpi"
}
