pkgname=d20-star-db-astap
pkgver=2023.03.18
pkgrel=3
pkgdesc="D20 star database for 10>FOV>0.3 degrees. Size 400 mb"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("d20_star_database.deb::https://downloads.sourceforge.net/project/astap-program/star_databases/d20_star_database.deb")
sha256sums=('9ae31902423ed51bbab431db78f703b77a44169b76a66789f5dbf65e83f3baa7')
depends=()
optdepends=('astap-bin: binary GTk version'
	    'astap-bin-qt5: binary Qt version'
	    'astap: sourced Qt version'
	    'astap-cli: CLI version'
    	    'hnsky-hg: planetarium program, hg-version'
	    'hnsky-bin: planetarium program, bin-version')


package() {
    tar xfv data.tar.xz -C "${pkgdir}"
    chmod 755 -R "${pkgdir}"
    chmod 644 "${pkgdir}"/opt/astap/*
}

