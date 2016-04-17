# Maintainer:  Nate Levesque <public at thenaterhood dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Matej Horváth <matej.horvath@gmail.com>

pkgname=gscreenshot
pkgver=2.3.3
pkgrel=2
epoch=
pkgdesc="A GUI front-end for scrot"
arch=('any')
url="https://github.com/thenaterhood/gscreenshot"
license=('GPL')
groups=()
depends=("python"
        "python-pillow"
        "scrot"
        "pygtk"
        "gtk3"
        "python-setuptools"
        "python-gobject")
makedepends=("unzip"
        "fakeroot")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/thenaterhood/gscreenshot/archive/v$pkgver.tar.gz")
sha256sums=('6187d1cebaf78cc27cf84e4504222a67b847ee3e37618ee3a68aff1df595fe6e')
validpgpkeys=()

prepare() {
        cd $srcdir/gscreenshot-$pkgver
}

build() {
        echo "Nothing to build"
}

check() {
        echo "Nothing to check"
}

package() {
        echo $pkgdir
        cd $srcdir/gscreenshot-$pkgver
        python setup.py install --root="$pkgdir/" --optimize=1
        chmod +x "$pkgdir/usr/bin/gscreenshot"
}
