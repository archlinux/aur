# Maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=steam-tui-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="Rust TUI client for steamcmd"
arch=('x86_64')
url="https://github.com/dmadisetti/steam-tui"
license=('MIT')
depends=('steamcmd')
optdepends=('wine: Launch Windows games')
conflicts=("steam-tui")
source=("$url/releases/download/0.1.0/steam-tui" "https://raw.githubusercontent.com/dmadisetti/steam-tui/main/LICENSE")
sha512sums=('919fdbf68330407f693e3f1e9b4941008eac5261c7faf5f25c3c024ba57a365f2fad07b04ac935e9009048a7dddbae942c94b61138fa377992fa9d784e3b1480' 'fa4585beeb62d89ed337fa651c5fcc0be0416c72f214312dcb01ccb872a7d651d76ec53644b0abcee74a385707b01318b15bc3cbbb12af33777a45cd7787af37')

package() {
	install -Dm755 steam-tui -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/steam-tui"
}
