pkgname=firefox-esr-extension-plasma-integration
pkgver=1.8.1
pkgrel=1
pkgdesc='plasma browser integration addon for firefox.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/'
license=('GPLV3')
depends=('firefox-esr' 'plasma-browser-integration')
groups=('firefox-esr-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3859385/plasma_integration-${pkgver}-fx.xpi")
sha512sums=('47bb922787bed93fc8317a5cab99a4ac487bb7b7a95c98ee6ee59511c29f811082e224a992e0147f76bb3271e055b3651535c7da448b684fada1bd1444407fc0')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox-esr/browser/extensions/plasma-browser-integration@kde.org.xpi"
}
