# This PKGBUILD is not a full PKGBUILD
# pkgver, source, and sha1sums are to be generated
pkgname=freecad-linkstage3-bin
pkgdesc='A general purpose 3D CAD modeler - Daily build of LinkDaily branch'
pkgrel=1
arch=(x86_64)
url='http://www.freecadweb.org/'
license=('LGPL')
conflicts=('freecad')
depends=(
	# Copied from Freecad package
	'boost-libs' 'curl' 'opencascade>=7.2' 'openmpi' 'xerces-c' 'libspnav' 'glew' 'netcdf' 'utf8cpp'
	'shared-mime-info' 'hicolor-icon-theme' 'jsoncpp' 'qt5-base' 'qt5-declarative'
	'qt5-svg' 'qt5-tools' 'qt5-x11extras' 'qt5-xmlpatterns' 'qt5-webkit' 'med'
	'python-pivy' 'pyside2' 'python-matplotlib' 'pyside2-tools' 'shiboken2'
)

## BEGIN generated variables
pkgver=2022.08.20.edge.r22.g56020b02d6
sha1sums=('f37acbfe845d7b77c7c2c80fe3ada2e82e57074c')

## END generated variables

source=("$pkgname-$pkgver.tar.zst::https://github.com/Bonnee/freecad-build-arch/releases/download/${pkgver}/${pkgname%-bin}-git-${pkgver}-${pkgrel}-${arch}.pkg.tar.zst")

package() {
	cp -r $srcdir/usr $pkgdir/
}

