# Maintainer: Jonathan Sumner Evans <sumner.evans98@gmail.com>
pkgname=menu-calc
pkgver=1.2
pkgrel=1
pkgdesc="A calculator for Rofi/dmenu(2)"
arch=('any')
url="https://github.com/sumnerevans/menu-calc"
license=('MIT')
depends=('bc' 'xclip')
optdepends=('dmenu: required if rofi is not installed'
            'rofi: required if dmenu is not installed')
source=("git+https://github.com/sumnerevans/menu-calc")
md5sums=('SKIP')

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 ./= "$pkgdir/usr/bin/="
    mkdir -p "$pkgdir/usr/share/man/man1"
    install -D -m644 ./=.1 "$pkgdir/usr/share/man/man1/=.1"
    install -D -m644 ./menu-calc.1 "$pkgdir/usr/share/man/man1/menu-calc.1"
}
