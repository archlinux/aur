# Maintainer:  Nate Levesque <public at thenaterhood dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Matej Horváth <matej.horvath@gmail.com>

pkgname=gscreenshot
pkgver=2.10.0
pkgrel=2
epoch=
pkgdesc="A simple screenshot tool supporting multiple backends"
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
sha256sums=('a119e814b0bf85816d0961823cf31e1145e416bc6dae1ad95f40729a3625e519')
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
        python setup.py install --root="$pkgdir/" --optimize=1 --force
        chmod +x "$pkgdir/usr/bin/gscreenshot"
}
