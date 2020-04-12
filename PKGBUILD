# Maintainer: Toqoz <https://github.com/Toqozz/slip>

pkgname=slip
pkgver=2.0.3
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
sha256sums=('50ee57e0807531291fe8793f73de0e05153413688762a469c92d7b5a4cdaf362')

package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 config "${pkgdir}/usr/share/doc/${pkgname}/config"
}
