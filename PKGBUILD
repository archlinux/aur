# Maintainer: DeepChirp <DeepChirp@outlook.com>
pkgname=aacs-keydb-daily
pkgver=20251016031759
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('ba986a8d6acfb2b216756c088f88f39d5b0673f66c47ccfe3cd2f0990226a937')

package() {
    install -d "${pkgdir}/etc/xdg/aacs" || return 1
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg" || return 1
}
