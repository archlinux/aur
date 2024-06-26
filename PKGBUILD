# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-tabler-icons
pkgver=3.7.0
pkgrel=1
pkgdesc="A set of over 5200 free high-quality icons"
arch=('any')
url="https://tabler.io/icons"
license=('MIT')
source=("https://github.com/tabler/tabler-icons/releases/download/v${pkgver}/tabler-icons-${pkgver}.zip"
        "${pkgname}-LICENSE::https://github.com/tabler/tabler-icons/raw/v${pkgver}/LICENSE")
sha256sums=('ae15057c3492f35da9a029b70e519fb192b83f06516fac03e1275b1678712a1f'
            'd5a3f948ae5cb95bfc4d2f767ef2bf6a778815b0ddb2d1c48037744cf636518e')

package() {
  install -Dm644 webfont/fonts/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
