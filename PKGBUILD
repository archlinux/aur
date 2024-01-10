# Maintainer: Yanli <mail@yanli.one>
pkgname=replicate-cog-bin
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc='Containers for machine learning'
arch=('x86_64' 'aarch64')
url="https://github.com/replicate/cog"
license=('unknown')
depends=('curl')
source=()
sha512sums=()

package() {
	mkdir "${pkgdir}/usr/local/bin/" -p
	curl -o "${pkgdir}/usr/local/bin/cog" -L https://github.com/replicate/cog/releases/latest/download/cog_`uname -s`_`uname -m`
	chmod +x "${pkgdir}/usr/local/bin/cog"
}