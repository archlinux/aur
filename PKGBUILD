# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-tabler-icons
pkgver=3.1.0
pkgrel=1
pkgdesc="A set of over 5200 free high-quality icons"
arch=('any')
url="https://tabler.io/icons"
license=('MIT')
source=("https://github.com/tabler/tabler-icons/releases/download/v${pkgver}/tabler-icons-${pkgver}.zip"
        "https://github.com/tabler/tabler-icons/raw/v${pkgver}/LICENSE")
sha256sums=('90d695d880cbe8173c99b3e507c622853229fa643647fb3cbe4cbe564bc536ac'
            'd5a3f948ae5cb95bfc4d2f767ef2bf6a778815b0ddb2d1c48037744cf636518e')

package() {
  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" webfont/fonts/*.ttf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
