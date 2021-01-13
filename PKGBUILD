# Maintainer epsilonKNOT <epsilon.aur@epsilonKNOT.xyz>

pkgbase=uwebsockets
pkgname=uwebsockets
pkgver=18.19.0
pkgrel=1
pkgdesc="Simple, secure & standards compliant web server for the most demanding of applications"
url="https://github.com/uNetworking/uWebSockets"
license=('Apache')
arch=('any')
source=( "${pkgname}-${pkgver}.tar.gz::https://github.com/uNetworking/uWebSockets/archive/v${pkgver}.tar.gz" )
md5sums=('770db1e669f5734fba07c7c7e7a104d9')
depends=( usockets )

package() {
	cd "uWebSockets-${pkgver}"
	mkdir -p "${pkgdir}"/usr/include/uWebSockets
	cp -a src/. "${pkgdir}"/usr/include/uWebSockets
}

#vim: syntax=sh
