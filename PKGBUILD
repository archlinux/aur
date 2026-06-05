pkgname="coreutils-uruguayo-bin"
pkgver="0.232"
pkgrel=3
pkgdesc="a binary version of coreutils-uruguayo (written in c++)! this package is NOT affiliated with (or supported by) GNU, coreutils, in any way"
provides=("coreutils-uruguayo")
conflicts=("coreutils-uruguayo")
arch=("x86_64")
url="https://github.com/aaronaaron1234/scr"
license=("custom")

source=("coreutils-uruguayo-bin::https://github.com/aaronaaron1234/scr/releases/download/binary2/coreutils-uruguayo-bin")
sha512sums=('60b9c70ec5821b1b74b7740ee8604ec1a09289f2dc974128a4202a7f080768aa98652e792c0adf338f6fcd548008e53d260dc62aff1c97ed29da446d7e6b5250')

package() {
	install -Dm755 "${srcdir}/coreutils-uruguayo-bin" "${pkgdir}/usr/bin/coreutils-uruguayo"
}
