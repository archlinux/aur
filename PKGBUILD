# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-catwalk-bin
pkgver=1.3.2 # renovate: datasource=github-tags depName=catppuccin/catwalk
pkgrel=1
pkgdesc="Soothing pastel previews for the high-spirited!"
url="https://github.com/catppuccin/catwalk"
provides=('catwalk')
conflicts=('catwalk' 'catwalk-bin' 'catppuccin-catwalk-bin')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/v${pkgver}/catwalk-${arch}-unknown-linux-gnu")
sha256sums=('bec3c321ffc71604ab2bd405cc8221e34b5739009508375a6a9f640d21860370')

package() {
	install -Dm755 catwalk-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/catwalk"
}
