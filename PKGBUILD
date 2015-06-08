# Maintainer: Ricardo Band <me@xengi.de>
pkgname=wallpapy
pkgver=1.0.0
pkgrel=2
pkgdesc="Simple wallpaper changer that uses nitrogen as its backend."
url="https://github.com/XenGi/wallpapy"
arch=('any')
license=('MIT')
depends=('nitrogen' 'python' 'python-docopt')
source=("https://github.com/XenGi/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/bin/"
    install -m755 wallpapy "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
