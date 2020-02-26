# Maintainer: Florent Guiotte <florent at guiotte dot fr>
pkgname=python-ipyvolume
pkgver=0.5.2
pkgrel=1
epoch=
pkgdesc="IPython widget for rendering 3d volumes and glyphs (e.g. scatter and quiver) in the Jupyter notebook"
arch=('x86_64')
url="https://github.com/maartenbreddels/ipyvolume"
license=('MIT')
groups=()
depends=(python python-numpy)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
md5sums=('9ff0792bc9ac60cfabe1c3d835fb40bf')
validpgpkeys=()

build() {
 	cd "$_name-$pkgver"
    python setup.py build
}

package() {
 	cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
