# Maintainer: Stanisław Jasiewicz <stjasiewicz@protonmail.com>
pkgname=nasher
pkgver=0.17.3
pkgrel=1
pkgdesc="A command-line utility for managing a Neverwinter Nights script or module repository"
arch=('any')
url="https://github.com/squattingmonk/nasher.nim"
license=('MIT')
depends=('nwnsc-bin' 'neverwinter.nim')
source=("https://github.com/squattingmonk/nasher/releases/download/$pkgver/nasher_linux.tar.gz")
md5sums=('116d7aa93220689d07290838477227ff')

package() {
	cd nasher_linux
    install -Dm 755 "nasher" -t "$pkgdir/usr/bin"
    install -Dm 755 "README.md" -t "$pkgdir/usr/share/nasher"
    install -Dm 755 "LICENSE" -t "$pkgdir/usr/share/nasher"
    install -Dm 755 "CHANGELOG.md" -t "$pkgdir/usr/share/nasher"
}
