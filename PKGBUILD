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
source=("https://github.com/sumnerevans/menu-calc/archive/v1.2.0.tar.gz")
md5sums=('f8526328f9e75e2ce1c718cb3c8939fd')

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    install -D -m755 ./= "$pkgdir/usr/bin/="
    mkdir -p "$pkgdir/usr/share/man/man1"
    install -D -m644 ./=.1 "$pkgdir/usr/share/man/man1/=.1"
    install -D -m644 ./menu-calc.1 "$pkgdir/usr/share/man/man1/menu-calc.1"
}
