# Maintainer: DeepChirp <DeepChirp@outlook.com>
pkgname=aacs-keydb-daily
pkgver=20250903032248
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('2f9f2177979b239e0a98a9f50692654f0dcf9e4f71c4b502641dff6bf71da087')

package() {
    install -d "${pkgdir}/etc/xdg/aacs" || return 1
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg" || return 1
}
