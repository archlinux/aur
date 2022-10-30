# Maintainer: Daurnimator <quae@daurnimator.com>
# Contributor: Hezekiah Michael <spiritomb@protonmail.com>

pkgname=firefox-extension-bypass-paywalls
pkgver=1.8.0
pkgrel=1
pkgdesc="Browser plugin to bypass paywalls on many news sites."
url="https://github.com/iamadamdev/bypass-paywalls-chrome/"
license=('MIT')
arch=('any')
groups=('firefox-addons')
depends=("firefox")
optdepends=("firefox-ublock-origin")
source=("https://github.com/iamadamdev/bypass-paywalls-chrome/releases/download/v${pkgver}/bypass-paywalls-firefox.xpi")
sha512sums=('2912eb4cb0164aea7f97976ca3351fb8b0e9ab0e624cfbb7a70ab21a477665d582211b08912e50f5df99b50f07b49f362f867a2c8d5e0422297a274339ff3753')
noextract=("bypass-paywalls-firefox.xpi")

package() {
    install -Dm644 "bypass-paywalls-firefox.xpi" \
        "${pkgdir}/usr/lib/firefox/browser/extensions/bypasspaywalls@bypasspaywalls.weebly.com.xpi"
}
