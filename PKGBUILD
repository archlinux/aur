# Maintainer: Nicola Lamacchia <nicola.lamacchia at gmail dot c0m>

_theme='Ardoise'
_style='translucent'
_keycode='165308'
pkgname=xcursor-ardoise-$_style
pkgver=2.7
pkgrel=1
pkgdesc="A simple, dark, flat and slightly translucent theme. It uses symbols instead of changing the shape of the cursor."
arch=('any')
url="http://gnome-look.org/content/show.php/$_theme?content=$_keycode"
license=('CCPL')
source=("http://nicola.link/files/icons/${_theme}_${_style}.tar.gz")
md5sums=('76293b2c033ae15f523fb1f1d5cf67de')

package() {
    install -dm755 "$pkgdir/usr/share/icons/${_theme}_${_style}"
    cd "$srcdir/${_theme}_${_style}"
    cp -R . "$pkgdir/usr/share/icons/${_theme}_${_style}"
}

build() {
    cd "$srcdir"
}

