pkgname=firefox-extension-gsconnect
pkgver=6
pkgrel=1
pkgdesc='gsconnect addon for firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/gsconnect/'
license=('GPLV3')
depends=('firefox' 'gnome-shell-extension-gsconnect')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/2104250/gsconnect-${pkgver}-an+fx-linux.xpi")
sha512sums=('f8424b82bbbfc5a54e074d6296223c550d65eb6849f75d9e891319bdade9984d6a44b87a2b8ca083ab32609ef9d25cbd3d380553bc4c1792254778ec514a9ac9')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/gsconnect@andyholmes.github.io.xpi"
}

