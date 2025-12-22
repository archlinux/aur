# Maintainer: jwty <janoosh@catgirls.party>

pkgname=ruri-bin
pkgver=2.1.1
pkgrel=1
pkgdesc='Calculates the CRC-32 of a file and checks it against the filename (Pre-built)'
arch=('x86_64')
url='https://gitlab.com/Timmy1e/ruri'
license=('AGPL3')
depends=('gcc-libs')
provides=('ruri')
conflicts=('ruri')
source=("ruri_${pkgver}_linux_x86_64.tar.xz::https://gitlab.com/api/v4/projects/6715630/packages/generic/linux-x86_64/v2.1.1/ruri-linux-x86_64.tar.xz")
sha256sums=('c0957ac9bcd78cec7f4bc87339d21e3d5b39397ab51f2127fb6e5cf39ac7ce20')

package() {
	cd "$srcdir/bin/"
	install -Dm755 ruri "${pkgdir}/usr/bin/ruri"
}
