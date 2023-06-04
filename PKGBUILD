pkgname=d05-star-db-astap
pkgver=2023.03.18
pkgrel=1
pkgdesc="D05 star database for 10>FOV>0.6 degrees. Size 100 mb."
arch=('any')
url="https://www.hnsky.org/astap.htm"
license=('LGPL3')
source=("d05.deb::https://downloads.sourceforge.net/project/astap-program/star_databases/d05_star_database.deb")
sha256sums=('e00b276e86c5673aef862d4fa093e739bd58cad267af916756409770fd0bd8eb')
depends=('astap')


package() {
    tar xfv data.tar.xz -C "${pkgdir}"
    chmod 755 -R "${pkgdir}"
    chmod 644 "${pkgdir}"/opt/astap/*
}
