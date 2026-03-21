# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-whiskers-bin
pkgver=2.8.0 # renovate: datasource=github-tags depName=catppuccin/whiskers
pkgrel=1
pkgdesc="Soothing port creation tool for the high-spirited!"
url="https://github.com/catppuccin/whiskers"
provides=('whiskers')
conflicts=('whiskers' 'whiskers-bin' 'catppuccin-whiskers-bin')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/v${pkgver}/whiskers-${arch}-unknown-linux-gnu")
sha256sums=('85009675f3b9d8e1f19a1bb321800b90227798bce29558626e6b49ad8e961aa3')

package() {
	install -Dm755 whiskers-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/whiskers"
}
