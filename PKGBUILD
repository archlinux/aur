# Maintainer: DeepChirp <DeepChirp@outlook.com>
pkgname=aacs-keydb-daily
pkgver=20250924183653
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('7e8e2d67d5c69b4a5e1464e141bf097ace2533a99848333a53e259344433d5cf')

package() {
    install -d "${pkgdir}/etc/xdg/aacs" || return 1
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg" || return 1
}
