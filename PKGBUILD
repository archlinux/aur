# Maintainer: dmadisetti <madisetti at pm dot me>
# Previous-maintainer: TabulateJarl8 <tabulatejarl8 at gmail dot com>

pkgname=steam-tui-bin
pkgver=0.2.1
pkgrel=3
pkgdesc="Rust TUI client for steamcmd"
arch=('x86_64')
url="https://github.com/dmadisetti/steam-tui"
license=('MIT')
depends=('steamcmd')
optdepends=('wine: Launch Windows games')
conflicts=("steam-tui")
source=("$url/releases/download/0.2.1/steam-tui" "https://raw.githubusercontent.com/dmadisetti/steam-tui/main/LICENSE")
sha512sums=('881e1e17ed127504629b21080bd794f969ea139e21820e173aefef17a375c9a5290fb9fac7f4a4807f959292397d80f1c67727e9b315cb51069d78b90b43c9e3' 'fa4585beeb62d89ed337fa651c5fcc0be0416c72f214312dcb01ccb872a7d651d76ec53644b0abcee74a385707b01318b15bc3cbbb12af33777a45cd7787af37')

package() {
	install -Dm755 steam-tui -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/steam-tui"
}
