# Maintainer: dzhi <0xdzhi@pm.me>
# Contributor: mhdi
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-tabler-icons
pkgver=3.46.0
pkgrel=1
pkgdesc="A set of free MIT-licensed high-quality icons"
arch=('any')
url="https://github.com/tabler/tabler-icons"
license=('MIT')

source=("https://registry.npmjs.org/@tabler/icons-webfont/-/icons-webfont-${pkgver}.tgz"
  "${pkgname}-LICENSE::https://raw.githubusercontent.com/tabler/tabler-icons/v${pkgver}/LICENSE")
sha256sums=('9664cd4fdbae3a25a523d9e4d2a922b2d9460495042e68f1087a55d63540aef4'
            'b740a1d46122672da62833e97f7e7c8a13fa85cbc7445b584b297cc00dde93db')

package() {
  install -Dm644 package/dist/fonts/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
