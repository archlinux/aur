# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=rustmission-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Performant TUI for Transmission capable of managing hundreds of torrents.'
url='https://github.com/intuis/rustmission'
license=(GPL-3.0-or-later)
depends=(openssl-1.1)
conflicts=(rustmission)
optionaldepends=(ttf-font-nerd: Nerd Font for icons)
arch=('x86_64')
source=("$url/releases/download/v${pkgver}/rustmission-x86_64-unknown-linux-gnu.tar.xz")
b2sums=('8978524ab5f2f52b55f5d8efeb6ec6aac8c428e87efb8ac135cd7f66d67ea9714401085b508d87027e02b7ba81398b12cad8ee65826da257be006bcd6de798d4')


package() {
  cd rustmission-x86_64-unknown-linux-gnu
  install -Dm755 rustmission "${pkgdir}/usr/bin/rustmission"
}
