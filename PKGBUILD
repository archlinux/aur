# Maintainer: jwty <janoosh@catgirls.party>

pkgname=ruri-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Calculates the CRC-32 of a file and checks it against the filename (Pre-built)'
arch=('x86_64')
url='https://gitlab.com/Timmy1e/ruri'
license=('AGPL3')
depends=('gcc-libs')
provides=('ruri')
conflicts=('ruri')
source=("ruri_${pkgver}_linux_x86_64.tar.xz::https://gitlab.com/Timmy1e/ruri/-/package_files/7612948/download")
sha256sums=('8158d926dd44a63a5295d62f3c441fdbc8ef240dd719740928bebf8423ee3d8e')

package() {
	cd "$srcdir/"
	install -Dm755 ruri "${pkgdir}/usr/bin/ruri"
}
