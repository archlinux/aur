# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-osp
pkgver=1.03a
pkgrel=3
pkgdesc="Orange Smoothie Productions (OSP) is a modification for Quake 3 that adds many client and server features while still being compatable with the stock game."
url="http://www.orangesmoothie.org/"
license=('custom')
arch=('any')
depends=('quake3')
source=("http://osp.dget.cc/orangesmoothie/downloads/osp-Quake3-${pkgver}_full.zip")
md5sums=('8b2b4925cce1895067bc617b86c62ea5')
noextract=("osp-Quake3-${pkgver}_full.zip")

package() {
    cd ${srcdir};

    # Base OSP Files
    install -d ${pkgdir}/opt/quake3/
    unzip osp-Quake3-1.03a_full.zip -d ${pkgdir}/opt/quake3/
}
