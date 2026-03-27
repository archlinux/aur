# Maintainer: dzhi <0xdzhi@pm.me>
# Contributor: mhdi
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-tabler-icons
pkgver=3.41.0
pkgrel=1
pkgdesc="A set of free MIT-licensed high-quality icons"
arch=('any')
url="https://tabler.io/icons"
license=('MIT')

source=("https://registry.npmjs.org/@tabler/icons-webfont/-/icons-webfont-${pkgver}.tgz"
  "${pkgname}-LICENSE::https://raw.githubusercontent.com/tabler/tabler-icons/v${pkgver}/LICENSE")
sha256sums=('c4ef0ab47d76ddc6ccc691c073c98b1d059d9d5d2b40327d8ff6a6116db685e4'
            'b740a1d46122672da62833e97f7e7c8a13fa85cbc7445b584b297cc00dde93db')

package() {
  install -Dm644 package/dist/fonts/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
