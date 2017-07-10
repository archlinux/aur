# Maintainer: Toqoz <https://github.com/Toqozz/slip>

pkgname=slip
pkgver=1.0.21
pkgrel=1
pkgdesc='dmenu/rofi (optional) interface to select and upload screenshots and gifs to imgur with the help of slop.  (Screencasts too).'
arch=('any')
url='https://github.com/Toqozz/slip'
license=('GPL')
depends=('curl' 'slop' 'maim')
optdepends=('dmenu:     interface'
            'rofi:      interface'
            'ffmpeg:    taking screencasts'
            'libnotify: upload notification'
            'xsel:      copy link to clipboard')
source=("https://github.com/Toqozz/slip/archive/${pkgver}.tar.gz")
sha256sums=('248fa6da2a407759c633576285f4ac9b98cd29c10e72bfba6bae62bea392ba56')

package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 config "${pkgdir}/usr/share/doc/${pkgname}/config"
}
