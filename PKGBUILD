# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-whiskers-bin
pkgver=2.7.0 # renovate: datasource=github-tags depName=catppuccin/whiskers
pkgrel=1
pkgdesc="Soothing port creation tool for the high-spirited!"
url="https://github.com/catppuccin/whiskers"
provides=('whiskers')
conflicts=('whiskers' 'whiskers-bin' 'catppuccin-whiskers-bin')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/v${pkgver}/whiskers-${arch}-unknown-linux-gnu")
sha256sums=('ce4e49a0293672cc01db49be0b946bd01c44108726694f996e029b5300e67227')

package() {
	install -Dm755 whiskers-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/whiskers"
}
