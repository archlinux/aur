# Maintainer: Toqoz <https://github.com/Toqozz/slip>

pkgname=slip
pkgver=1.2.0
pkgrel=1
pkgdesc='dmenu/rofi (optional) interface to select and upload screenshots and gifs to imgur and gfycat with the help of slop.  (Screencasts too).'
arch=('any')
url='https://github.com/Toqozz/slip'
license=('GPL')
depends=('curl' 'slop' 'maim' 'xsel' 'jq')
optdepends=('dmenu:     interface'
            'rofi:      interface'
            'ffmpeg:    taking screencasts'
            'libnotify: upload notification')
source=("https://github.com/Toqozz/slip/archive/${pkgver}.tar.gz")
sha256sums=('dde8f3048bbb95be6bc79b4889b47482a0631f8584152145c3f74405187dfe58')

package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 config "${pkgdir}/usr/share/doc/${pkgname}/config"
}
