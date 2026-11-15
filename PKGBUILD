# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-whiskers-bin
pkgver=2.10.0 # renovate: datasource=github-tags depName=catppuccin/whiskers
pkgrel=1
pkgdesc="Soothing port creation tool for the high-spirited!"
url="https://github.com/catppuccin/whiskers"
provides=('whiskers')
conflicts=('whiskers' 'whiskers-bin' 'catppuccin-whiskers-bin')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/v${pkgver}/whiskers-${arch}-unknown-linux-gnu")
sha256sums=('75a1d3e208e8691fb78a8f0c281e411cb6fb6a6b82a14266b3cdb725c2289aa9')

package() {
	install -Dm755 whiskers-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/whiskers"
}
