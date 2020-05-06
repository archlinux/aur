pkgname=firefox-extension-kdeconnect
pkgver=0.1.4
pkgrel=1
pkgdesc='kdeconnect addon for firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/kde_connect/'
license=('GPLV3')
depends=('firefox' 'kdeconnect')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/805784/kde_connect-${pkgver}-an+fx-linux.xpi")
sha512sums=('c013d15d3fda892e22408a0d2f19eee6d147c4d717074ca14d5e1e5cb85359b41221ba57642d66061e77a38a2b1b4e971a2e1da131693e1f7b4322c23bfcbc28')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/kde-connect@0xc0dedbad.com.xpi"
}

