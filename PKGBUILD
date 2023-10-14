# Maintainer: Stanisław Jasiewicz <stjasiewicz@protonmail.com>
pkgname=nasher-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="A command-line utility for managing a Neverwinter Nights script or module repository"
arch=('any')
url="https://github.com/squattingmonk/nasher.nim"
license=('MIT')
depends=('neverwinter.nim-bin')
optdepends=('nwnsc-bin: alternative compiler')
conflicts=('nasher')
source=("https://github.com/squattingmonk/nasher/releases/download/$pkgver/nasher_linux.tar.gz")
md5sums=('8f502cc028aaeda56878f47d7294a0f6')

package() {
	cd nasher_linux
    install -Dm 755 "nasher" -t "$pkgdir/usr/bin"
    install -Dm 755 "README.md" -t "$pkgdir/usr/share/nasher"
    install -Dm 755 "LICENSE" -t "$pkgdir/usr/share/nasher"
    install -Dm 755 "CHANGELOG.md" -t "$pkgdir/usr/share/nasher"
}
