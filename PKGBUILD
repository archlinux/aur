# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
pkgname=aacs-keydb-daily
pkgver=20261128001901
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
provides=("${pkgname%-daily}")
conflicts=("${pkgname%-daily}")
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('5ed4af75c53ddab55af719f0709b93841007d1a8bc68a65e7c44fed574d8226c')

package() {
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg"
}
