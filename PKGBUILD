# Maintainer: Matthew Wilding <mbwilding at gmail dot com>

pkgname=("ttf-neospleen-nerd-font")
pkgver=1.1.64
pkgrel=1
pkgdesc="A modern monospaced font inspired by Spleen - Nerd Font"
url="https://github.com/mbwilding/NeoSpleen"
license=("BSD-2-Clause")
arch=("any")
source=("https://github.com/mbwilding/NeoSpleen/releases/download/$pkgver/NeoSpleenNerdFont-TTF.zip")
b2sums=('16f834ffa5c60102c21d99520cb0968d9cbbe47d2b881358459766789a323ea98725c95b779e0ae6a3491b695fffd752d4fba36bbaac668297b45440dbc8f2d6')

package() {
  install -d ${pkgdir}/usr/share/fonts/NeoSpleen
  cp *.ttf ${pkgdir}/usr/share/fonts/NeoSpleen
}
