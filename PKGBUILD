# Maintainer: Giga300 <giga300@protonmail.com>
# Contributor: Giga300 <giga300@protonmail.com>

pkgname=luna
pkgver=2.0.0
_pkgver=v200
pkgrel=1
pkgdesc="npm management through a modern UI. Created with ReactJS and Redux, Material-UI. Bundled with Webpack. Build on Electron."
arch=('x86_64')
depends=('npm' 'node' 'yarn')
url="https://github.com/rvpanoz/luna"
license=('GPL-3.0')
groups=('')
options=('!strip' '!emptydirs')

source_x86_64=("http://104.236.58.95/luna/releases/${_pkgver}/luna_${pkgver}_amd64.deb")
sha512sums_x86_64=('8d73936c95017de1e30a01520881c6b85b252f2cfa62871b51d96f0d627e39c7674b387a741ae4291e915f439128da2bd29c2d2a60f6f589cc21c4d00675477f')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Symlink
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/Luna/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
