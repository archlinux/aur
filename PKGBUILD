# Maintainer: DeepChirp <DeepChirp@outlook.com>
pkgname=aacs-keydb-daily
pkgver=20250822033008
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('82c5fb2fd66df393c16d373c3d03dc2b9483a51200d7c310e49cd0a2f04c02b6')

package() {
    install -d "${pkgdir}/etc/xdg/aacs" || return 1
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg" || return 1
}
