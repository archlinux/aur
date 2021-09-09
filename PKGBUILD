# Maintainer: r6eve <r6eve at acm dot org>

pkgname=tmux-tanlog-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Save all console outputs into files'
arch=('x86_64')
url='https://github.com/r6eve/tmux-tanlog'
license=('Boost')
depends=('tmux' 'zsh')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${url}/releases/download/${pkgver}/${pkgname%-bin}-${CARCH}-unknown-linux-musl")
sha256sums=('a024ec1f0f5514cfcaea3debed9fc82abfd32fc4a664daf8d8be078f3a86cf2a')

package() {
  mv "${pkgname%-bin}-${CARCH}-unknown-linux-musl" "${pkgname%-bin}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "${pkgname%-bin}"
}
