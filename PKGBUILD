# Maintainer: levinit <levinit@outlook.com>
pkgname=clamtk-gnome
pkgver=0.0.2
pkgrel=1
pkgdesc="a simple plugin for ClamTk to allow a right-click, context menu scan of files or folders in the Nautilus file manager."
arch=('any')
url="https://github.com/dave-theunsub/clamtk-gnome"
license=('GPL')
depends=('clamtk' 'nautilus')

source=("https://github.com/dave-theunsub/clamtk-gnome/archive/master.zip")

md5sums=('SKIP')

package() {
    cd ${srcdir}/${pkgname}-master/
    install -m 755 -D ${pkgname}.py "${pkgdir}/usr/share/nautilus-python/extensions/{pkgname}.py"
    install -m 644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
