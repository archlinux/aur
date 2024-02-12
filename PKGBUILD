pkgname=firefox-esr-extension-switchyomega
pkgver=2.5.20
pkgrel=2
pkgdesc='Manage and switch between multiple proxies quickly & easily.'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/switchyomega/'
license=('GPLV3')
depends=('firefox-esr')
groups=('firefox-esr-addons')
source=("extension.xpi::https://github.com/FelisCatus/SwitchyOmega/releases/download/v$pkgver/proxy_switchyomega-$pkgver-an+fx.xpi")
sha512sums=('39c4c260ed62f93145da6368d5fd121df2777c065c4c4e93a39065b8f7ddbeeb8b387369b99c615d0bc59dfc49037c2b4817f881fc84dfe7bf43cd66f64367c7')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firefox-esr/browser/extensions/switchyomega@feliscatus.addons.mozilla.org.xpi"
}
