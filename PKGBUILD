# Maintainer: esrh - https://esrh.me
# Desktop file from gtkcord4-git by dawson dias

pkgname=gtkcord4-bin
_pkgname=gtkcord4
pkgver=0.0.3
pkgrel=1
pkgdesc='Discord client written in go and gtk4, binary release'
arch=('x86_64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
provides=('gtkcord4')
conflicts=('gtkcord4' 'gtkcord4-git')
depends=('gtk4' 'gobject-introspection')
source=('https://github.com/diamondburned/gtkcord4/releases/download/v0.0.3-2/gtkcord4-linux-x86_64.tar.gz'
       'gtkcord4.desktop::https://aur.archlinux.org/cgit/aur.git/plain/gtkcord4.desktop?h=gtkcord4-git')
sha256sums=('SKIP' 'SKIP')

package() {
    tar -xzf gtkcord4-linux-x86_64.tar.gz
    install -Dm755 gtkcord4 "$pkgdir"/usr/bin/gtkcord4
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
