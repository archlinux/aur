# Maintainer: Steven Pease <peasteven@gmail.com>

_commit='da5ccb8'
pkgname=gtk-theme-razor-sharp
pkgver=r11.${_commit}
pkgrel=1
pkgdesc="A Amazing GTK3/4 red theme made by NillyTheL0L"
url="https://www.gnome-look.org/p/1708445"
arch=('any')
license=('GPL3')
source=("https://github.com/nillythel0l/razor-sharp/archive/${_commit}.tar.gz")
sha256sums=('af258097e176ad7572b6d22ef8295b34955063fdb1eafbc6b5a48b04f04b19c1')
options=(!strip)

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    mv -n "${srcdir}/razor-sharp-${_commit}"* "${pkgdir}/usr/share/themes/razor-sharp"
}
