# Maintainer: Toqoz <https://github.com/Toqozz/slip>

pkgname=slip
pkgver=1.0.22.1
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
sha256sums=('a44c947933d01fd6b091ef6f12dc4a4d28fbcf7cdb853906e243239a77469c97')

package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 config "${pkgdir}/usr/share/doc/${pkgname}/config"
}
