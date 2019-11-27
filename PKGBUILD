pkgname=firefox-extension-plasma-integration
pkgver=1.7
pkgrel=1
pkgdesc='plasma browser integration addon for firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/'
license=('GPLV3')
depends=('firefox' 'plasma-browser-integration')
groups=('firefox-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3392927/plasma_integration-${pkgver}-fx.xpi")
sha512sums=('7cf6aa1f8297044052acddb3355f1f86d5d996103568f212244edc5f1c7ce9caa7408fb6cb1652d31ab75e2bc205a6036cbfa224492e5092b1122d9e2e22489a')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox/browser/extensions/plasma-browser-integration@kde.org.xpi"
}
