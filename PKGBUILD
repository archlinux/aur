# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-tabler-icons
pkgver=3.0.0
pkgrel=1
pkgdesc="A set of over 5200 free high-quality icons"
arch=('any')
url="https://tabler.io/icons"
license=('MIT')
source=("https://github.com/tabler/tabler-icons/releases/download/v${pkgver}/tabler-icons-${pkgver}.zip"
        "https://github.com/tabler/tabler-icons/raw/v${pkgver}/LICENSE")
sha256sums=('6f312712f47a6b86ad6c1e1640fc69290e64aeceac3045ec760b8587fbf27b2b'
            'd5a3f948ae5cb95bfc4d2f767ef2bf6a778815b0ddb2d1c48037744cf636518e')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" webfont/fonts/*.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
