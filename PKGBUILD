# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Alexis Janon <kardyne -at- gmail -dot- com>

pkgname=ttf-tabler-icons
pkgver=3.24.0
pkgrel=1
pkgdesc="A set of free MIT-licensed high-quality icons"
arch=('any')
url="https://tabler.io/icons"
license=('MIT')
source=("https://github.com/tabler/tabler-icons/releases/download/v${pkgver}/tabler-icons-${pkgver}.zip"
        "${pkgname}-LICENSE::https://github.com/tabler/tabler-icons/raw/v${pkgver}/LICENSE")
sha256sums=('c77ef90907a8ab3231a61547356f0f2fe72d4ab32ecd18943dc9df7619c1f9ad'
            'd5a3f948ae5cb95bfc4d2f767ef2bf6a778815b0ddb2d1c48037744cf636518e')

package() {
  install -Dm644 webfont/fonts/*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "${pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
