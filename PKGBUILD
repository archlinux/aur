# Maintainer: DeepChirp <DeepChirp@outlook.com>
pkgname=aacs-keydb-daily
pkgver=20251201000017
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('0da16992216593bca4599fb40d8c46b999051faabbb88a736194f03bb0690373')

package() {
    install -d "${pkgdir}/etc/xdg/aacs" || return 1
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg" || return 1
}
