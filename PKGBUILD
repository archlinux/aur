# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=xtandem-cyclone
pkgver=12.10.01.1
pkgrel=1
pkgdesc="Software that can match tandem mass spectra with peptide sequences, in a process known as protein identification. Version CYCLONE"
arch=('x86_64')
url="http://www.thegpm.org/TANDEM/"
license=('PerlArtistic')
depends=('gcc-libs')
conflicts=('xtandem')
source=("ftp://ftp.thegpm.org/projects/tandem/source/2012-10-01/tandem-linux-${pkgver//\./-}.zip")
md5sums=('9e16dccfea333bad8f6d4b36ba30265f')
package() {
	cd "tandem-linux-${pkgver//\./-}"
	install -Dt $pkgdir/usr/bin bin/*.exe
}
