# Maintainer: Chiron Horwood <chiron.dev8@gmail.com>
# This is my first package!!!!
# POSIX compliant!
pkgname=writedoc
pkgver=2.1
pkgrel=2
pkgdesc="A fast way of creating and editing notes using neovim without defining a file path"
arch=('any')
url="https://github.com/Chiron8/writedoc"
license=('MIT')
depends=('nvim' 'sh')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Chiron8/writedoc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('306a2a0298a8c36c990403f9db73057c1202d7fea5ef08248e24b9b9e13a028b')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 writedoc "$pkgdir/usr/bin/writedoc"
    install -Dm644 directory.txt "$pkgdir/usr/share/$pkgname/directory.txt"
    install -Dm644 ft.txt "$pkgdir/usr/share/$pkgname/ft.txt"
    install -Dm644 writedoc.1 "$pkgdir/usr/share/man/man1/writedoc.1"
    install -Dm644 README.md "$pkgdir/usr/share/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
