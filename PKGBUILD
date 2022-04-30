# Maintainer: Darjan Krijan (daren) <darjan_krijan@gmx.de>

pkgname=maqao-bin
pkgver=2.15.0
pkgrel=1
pkgdesc="MAQAO - Modular Assembly Quality Analyzer and Optimizer"
arch=('x86_64')
license=('LGPL3')
url="http://www.maqao.org"
source=("http://www.maqao.org/release/${pkgname%-bin}.intel64.${pkgver}.tar.xz")
conflicts=('maqao')
md5sums=("6d5c264890c41f5400e4c269c13125f3")

package() {
	prefix=${pkgdir}/usr
	mkdir -p ${prefix}/{bin,share/man/man1,share/licenses/maqao}

	cd ${srcdir}/${pkgname%-bin}.intel64.${pkgver}

	cp -p maqao.intel64 ${prefix}/bin
	cp -p man/* ${prefix}/share/man/man1
	cp -p LICENSE ${prefix}/share/licenses/maqao
}
