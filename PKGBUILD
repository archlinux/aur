# Maintainer: Stanisław Jasiewicz <stjasiewicz@protonmail.com>
pkgname=nasher-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="A command-line utility for managing a Neverwinter Nights script or module repository"
arch=('any')
url="https://github.com/squattingmonk/nasher.nim"
license=('MIT')
depends=('neverwinter.nim')
optdepends=('nwnsc-bin: alternative compiler')
conflicts=('nasher')
provides=('nasher')
source=("https://github.com/squattingmonk/nasher/releases/download/$pkgver/nasher_linux.tar.gz")
md5sums=('0cf9c4d7826f7fa10dd4e0a6fb13b66a')

package() {
    install -Dm 755 "nasher" -t "$pkgdir/usr/bin"
    install -Dm 755 "README.md" -t "$pkgdir/usr/share/nasher"
    install -Dm 755 "LICENSE" -t "$pkgdir/usr/share/nasher"
    install -Dm 755 "CHANGELOG.md" -t "$pkgdir/usr/share/nasher"
}
