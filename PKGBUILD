# Maintainer: Giga300 <giga300@protonmail.com>
# Contributor: Giga300 <giga300@protonmail.com>

pkgname=luna
pkgver=2.1.0
pkgrel=1
pkgdesc="npm management through a modern UI. Created with ReactJS and Redux, Material-UI. Bundled with Webpack. Build on Electron."
arch=('x86_64')
depends=('npm' 'yarn')
url="https://github.com/rvpanoz/luna"
license=('GPL-3.0')
groups=('')
options=('!strip' '!emptydirs')

source_x86_64=("https://github.com/rvpanoz/luna/releases/download/v${pkgver}/luna_${pkgver}_amd64.deb")
sha512sums_x86_64=('e3243db4ebc4d6aa70cd0b209bcb86a3b59cec47cd9d35260386cc0f6570b8679a2ecdbdd9dd26275d02637603604031bef04ad3c68fe70d730fb9bb045fe5a6')

package() {
	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# Symlink
	install -d "${pkgdir}/usr/bin"
	ln -s "/opt/Luna/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
