# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-catwalk-bin
pkgver=1.3.1 # renovate: datasource=github-tags depName=catppuccin/catwalk
pkgrel=1
pkgdesc="Soothing pastel previews for the high-spirited!"
url="https://github.com/catppuccin/catwalk"
provides=('catwalk')
conflicts=('catwalk' 'catwalk-bin' 'catppuccin-catwalk-bin')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/v${pkgver}/catwalk-${arch}-unknown-linux-gnu")
sha256sums=('c53b1f276087bf440446133f140bcb9a3a5bdb5fbc1c569ab6c9a5b4f8db59d3')

package() {
	install -Dm755 catwalk-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/catwalk"
}
