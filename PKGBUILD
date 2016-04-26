# Maintainer: Noeljnuior <liamgliam @ gmail.com>

pkgname=conky-bargile
pkgver=0.1a
pkgrel=2
pkgdesc="Yet another conky-lua theme, this one includes some kind of an engine"
arch=('any')
url="https://github.com/Noeljunior/conky-bargile"
license=('GPL')
depends=('conky-lua' 'lm_sensors' 'hddtemp' 'git')
source=("$pkgname::git+https://github.com/Noeljunior/conky-bargile")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname

    ./configure "/etc/conky" "/usr/share/${pkgname}"
	make install BINDIR="${pkgdir}/usr/bin" CONFDIR="${pkgdir}/etc/conky" USRDIR="${pkgdir}/usr/share/${pkgname}"
}


