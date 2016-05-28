# Maintainer: Toqoz <https://github.com/Toqozz/slip>

pkgname=slip
pkgver=1.0.7
pkgrel=1
pkgdesc='dmenu interface to select and upload screen(shot) to imgur with the help of slop.  (Screencasts too)'
arch=('any')
url='https://github.com/Toqozz/slip'
license=('GPL')
depends=('curl' 'slop' 'dmenu' 'maim')
optdepends=('ffmpeg:    taking screencasts'
            'libnotify: upload notification'
            'xsel:      copy link to clipboard')
source=("https://github.com/Toqozz/slip/archive/${pkgver}.tar.gz")
sha256sums=('ca22d1e8f01a4e53f963574fdf5e689d05a3b442d427e01de3d1da69d2c6ef0b')

package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
