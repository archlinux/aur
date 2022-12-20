# Maintainer: Darjan Krijan [https://disc-kuraudo.eu]

pkgname=disc-kuraudo-home
pkgver=0.1.0
pkgrel=1
pkgdesc="Disc Kuraudo - The Disc Cloud"
arch=('x86_64')
license=('custom')
url='https://disc-kuraudo.eu'
depends=(
	'barcode'
	'bash'
	'cdrtools'
	'cdrdao'
	'diffutils'
	'ddrescue'
	'imagemagick'
	'jq'
	'libudfread-dk'
)
provides=(
	'disc-kuraudo'
)
source=('https://disc-kuraudo.eu/releases/disc-kuraudo-home-0.1.0.tar.xz')
sha256sums=('c889c81acaf8be674dd15c5446593bd734984bdd3ff0eb2050de607c3793efdb')

package() {
	cp -rp "${srcdir}/${pkgname}-${pkgver}/"* "${pkgdir}"
}
