# Maintainer: Catppuccin <releases@catppuccin.com>

pkgname=catppuccin-whiskers-bin
pkgver=2.4.0 # renovate: datasource=github-tags depName=catppuccin/whiskers
pkgrel=1
pkgdesc="Soothing port creation tool for the high-spirited!"
url="https://github.com/catppuccin/whiskers"
provides=('whiskers')
conflicts=('whiskers' 'whiskers-bin' 'catppuccin-whiskers-bin')
license=('MIT')
arch=('x86_64')

source=("${url}/releases/download/v${pkgver}/whiskers-${arch}-unknown-linux-gnu")
sha256sums=('9efd348dbbae5b9f7da58602130ab1b26066198f010a464eb1482a9687b606e2')

package() {
	install -Dm755 whiskers-${arch}-unknown-linux-gnu "${pkgdir}/usr/bin/whiskers"
}
