# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
pkgname=aacs-keydb-daily
pkgver=20261110002211
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
provides=("${pkgname%-daily}")
conflicts=("${pkgname%-daily}")
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('5f510be4d40ef2d867f415bbed263f2a9af846be416b6f068a6387442f0487f7')

package() {
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg"
}
