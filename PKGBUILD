# Maintainer: jwty <janoosh@catgirls.party>

pkgname=ruri-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='Calculates the CRC-32 of a file and checks it against the filename (Pre-built)'
arch=('x86_64')
url='https://gitlab.com/Timmy1e/ruri'
license=('AGPL3')
depends=('gcc-libs')
provides=('ruri')
conflicts=('ruri')
source=("ruri_${pkgver}_linux_x86_64.tar.xz::https://gitlab.com/api/v4/projects/6715630/packages/generic/linux-x86_64/v2.1.0/ruri-linux-x86_64.tar.xz")
sha256sums=('b505c073729f29f5d5cb3a3f4372f10c5906082c4c1ca713abf722e31bbf0b98')

package() {
	cd "$srcdir/bin/"
	install -Dm755 ruri "${pkgdir}/usr/bin/ruri"
}
