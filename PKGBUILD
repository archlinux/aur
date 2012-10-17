# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=4.0.0_0
pkgrel=1
pkgdesc="RILOE II/iLo online configuration utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(hp-health libxslt)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "x86_64" ] && depends=(${depends[@]} lib32-glibc)

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/RedHatEnterpriseServer/6.2/packages/i386/${pkgname}-${pkgver//_/-}.noarch.rpm)

package() {
	cp -a "$srcdir/"{sbin,usr} "$pkgdir"
}

sha256sums=('6c72585ab42c232651c090b5a42372e2f8a756778449b9a726a6560070aa95f1')
