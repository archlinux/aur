pkgname=pyvidctrl
pkgver=0.1
pkgrel=1
pkgdesc="A simple TUI util to control V4L2 camera parameters"
arch=(any)
url="https://github.com/antmicro/pyvidctrl"
license=(MIT)
depends=(python python-v4l2_antmicro)
source=("pyvidctrl::git+https://github.com/antmicro/pyvidctrl#commit=de0e394")
sha256sums=("SKIP")

build() {
	cd $srcdir/$pkgname
	python setup.py build
}

package() {
	cd $srcdir/$pkgname
	python setup.py install --root=$pkgdir --optimize=1 --skip-build
}

