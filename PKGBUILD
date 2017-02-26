# Maintainer: Toqoz <https://github.com/Toqozz/slip>

pkgname=slip
pkgver=1.0.17
pkgrel=1
pkgdesc='dmenu/rofi (optional) interface to select and upload screen(shots) to imgur with the help of slop.  (Screencasts too)'
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
sha256sums=('dc803d863100db530e54f1ba0337da47d2bdfadac64f8424aa144ad4ef48a203')

package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 config "{pkgdir}/usr/share/doc/${pkgname}/config"
}
