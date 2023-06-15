pkgname=g05-star-db-astap
pkgver=2023.03.22
pkgrel=1
pkgdesc="G05 star database for 20>FOV>0.6 degrees. Size 100 MB"
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("g05_star_database.deb::https://downloads.sourceforge.net/project/astap-program/star_databases/g05_star_database.deb")
md5sums=('63a92e1056dbd8fc84676ff5cdc14ced')
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
