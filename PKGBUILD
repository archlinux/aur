# Maintainer: CofinCup <cofincup@gmail.com>

pkgname=cofincup-pomo
pkgver=1.0
pkgrel=1
install="${pkgname}.install"
pkgdesc="A simple pomodoro timer script"
arch=('any')
url="https://github.com/CofinCup/nerd-scripts/tree/main/cofincup-pomo.sh"
license=('GPL')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/CofinCup/nerd-scripts/archive/refs/tags/v1.0.tar.gz")

package() {
    cd "${srcdir}/nerd-scripts-1.0/pomo"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 cofincup-pomo.sh "$pkgdir/usr/bin/pomo"
}


sha256sums=('e403cd2bc0975eb6a651001ef7eff236ef17f3250bdeac2fc7404516eb143d2c')
