# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-whiskers-bin
pkgver=2.3.0 # renovate: datasource=github-tags depName=catppuccin/whiskers
pkgrel=1
pkgdesc="Soothing port creation tool for the high-spirited!"
url="https://github.com/catppuccin/whiskers"
provides=('whiskers')
conflicts=('whiskers' 'whiskers-bin' 'catppuccin-whiskers-bin')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/v${pkgver}/whiskers-${arch}-unknown-linux-gnu")
sha256sums=('c1f6588ad551ac54ff1316b17dafb5edd77f97b1054d26479299366190bc2833')

package() {
	install -Dm755 whiskers-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/whiskers"
}
