# Mainteiner: Hanashiko <hlichisper@gmail.com>
pkgname=display-profiles
pkgver=0.1.0
pkgrel=1
pkgdesc="TUI/CLI tool for managing and auto-switching display configurations via xrandr and kscreen-doctor"
arch=('any')
url="https://github.com/Hanashiko/display-profiles"
license=('MIT')
depends=('python' 'ncurses')
makedepends=()
provides=('display-profiles')
conflicts=('display-profiles')
source=("display-profiles" "LICENSE" "README.md")
sha256sums=('9335addf978b591161950b8ab4dbbf6ce38c6a42c143aa35a6ed3641bd8f3c59' 
            '97ad9eb02154bcf1ea19abb6b529506eb0b20df9f0aefb8b11b87af1b2c4f884' 
            'bb4446afcbda34f8392a7bb50e6fc2ca2d54186bab9504676e040691a612afb7')

package() {
    install -Dm755 "$srcdir/display-profiles" "$pkgdir/usr/bin//display-profiles"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README/md"
}