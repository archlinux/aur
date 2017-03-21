# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=xtandem
pkgver=17.02.01.4
pkgrel=1
pkgdesc="Software that can match tandem mass spectra with peptide sequences, in a process known as protein identification."
arch=('x86_64')
url="http://www.thegpm.org/TANDEM/"
license=('PerlArtistic')
depends=('expat' 'gcc-libs')
source=("ftp://ftp.thegpm.org/projects/tandem/source/tandem-linux-${pkgver//\./-}.zip")
md5sums=('128e18ca79950b2dda4f5e5249f6091b')
package() {
	cd "tandem-linux-${pkgver//\./-}"
	install -Dt $pkgdir/usr/bin bin/*.exe
}
