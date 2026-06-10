# Maintainer: MarkGMX8X <inspace2025@mail.ru>

pkgname=papt
pkgver=0.9.5
pkgrel=1
pkgdesc="ENG:A wrapper for pacman with apt-like syntax. Manage packages in Arch Linux using simple commands: install, remove, update, search. RUS:Обертка для pacman с синтаксисом, подобным apt. Управляйте пакетами в Arch Linux с помощью простых команд:install, remove, update, search."
arch=('any')
url="https://github.com/MarkGMX8X/papt"
license=('GPL-3.0-only')
depends=('python' 'pacman')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MarkGMX8X/papt/archive/refs/tags/Papt_0xx.tar.gz")
sha256sums=('0bfb95cd4c8ec794f0c09ba1101808f2d25c432924f0bbf33e9628b68c800339')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 papt "$pkgdir/usr/bin/papt"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}