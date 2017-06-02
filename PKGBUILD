# Maintainer:  Nate Levesque <public at thenaterhood dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Matej Horváth <matej.horvath@gmail.com>

pkgname=gscreenshot
pkgver=2.7.1
pkgrel=1
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
makedepends=("fakeroot")
checkdepends=()
optdepends=('slop: improved region and window selection'
            'xclip: command line clipboard support'
            'xdg-utils: for opening screenshot files from gscreenshot')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/thenaterhood/gscreenshot/archive/v$pkgver.tar.gz")
sha256sums=('17ded6221ea7e3271e9550300a680297fba9e1ca096dc4fb74114f50b2342c09')
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
