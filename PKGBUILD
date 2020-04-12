# Maintainer: Toqoz <https://github.com/Toqozz/slip>

pkgname=slip
pkgver=2.0.2
pkgrel=1
pkgdesc='rofi/dmenu (optional) interface to select and upload screenshots and gifs to imgur and gfycat with the help of slop.  (Screencasts too).'
arch=('any')
url='https://github.com/Toqozz/slip'
license=('GPL')
depends=('curl' 'slop' 'maim' 'xsel' 'jq')
optdepends=('dmenu:     interface'
            'rofi:      interface'
            'ffmpeg:    taking screencasts'
            'libnotify: upload notification')
source=("https://github.com/Toqozz/slip/archive/${pkgver}.tar.gz")
sha256sums=('797741fd80de47afd91ffd67eb954e18f266e31c48e86642bab37b5093708657')

package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 config "${pkgdir}/usr/share/doc/${pkgname}/config"
}
