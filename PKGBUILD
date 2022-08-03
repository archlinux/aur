# Maintainer: jwty <janoosh@catgirls.party>

pkgname=ruri-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='Calculates the CRC-32 of a file and checks it against the filename (Pre-built)'
arch=('x86_64')
url='https://gitlab.com/Timmy1e/ruri'
license=('AGPL3')
depends=('gcc-libs')
provides=('ruri')
conflicts=('ruri')
source=("ruri_${pkgver}_linux_x86_64.tar.xz::https://gitlab.com/api/v4/projects/6715630/packages/generic/linux-x86_64/v2.0.1/ruri-linux-x86_64.tar.xz")
sha256sums=('32f740db03f4d72433292870693b6c7ea3e4b0cb897967e6ac04485e7a2d1de7')

package() {
	cd "$srcdir/bin/"
	install -Dm755 ruri "${pkgdir}/usr/bin/ruri"
}
