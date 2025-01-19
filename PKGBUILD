# Maintainer: database64128 <free122448@hotmail.com>

pkgname=f41-backgrounds
pkgver=41.0.2
pkgrel=1
pkgdesc="Desktop backgrounds of the Fedora 41 default theme for GNOME, KDE, Mate and Xfce desktops"
arch=('any')
url="https://github.com/fedoradesign/backgrounds"
license=('CC-BY-SA-4.0')
source=("https://github.com/fedoradesign/backgrounds/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
b2sums=('b28e225f8787d22967c025880a7690008bdbb771ef6663b6498f9026aff96922aa2c40c77e9c54e73897ed96904a14475f2cbf6ee95fc18e0f3e094d395922b4')

build() {
    cd $pkgname
    make
}

package() {
    cd $pkgname
    make install DESTDIR="$pkgdir"
}
