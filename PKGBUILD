# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-tabler-icons
pkgver=3.20.0
pkgrel=1
pkgdesc="A set of free MIT-licensed high-quality icons"
arch=('any')
url="https://tabler.io/icons"
license=('MIT')
source=("https://github.com/tabler/tabler-icons/releases/download/v${pkgver}/tabler-icons-${pkgver}.zip"
        "${pkgname}-LICENSE::https://github.com/tabler/tabler-icons/raw/v${pkgver}/LICENSE")
sha256sums=('de937709c8727dd9d99e557855b9f27ce9516c5f042174fbc732ca37c3640d9f'
            'd5a3f948ae5cb95bfc4d2f767ef2bf6a778815b0ddb2d1c48037744cf636518e')

package() {
  install -Dm644 webfont/fonts/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
