# Maintainer: DeepChirp <DeepChirp@outlook.com>
pkgname=aacs-keydb-daily
pkgver=20250707095314
pkgrel=2
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
source=('https://web.archive.org/web/20250707095314/http://fvonline-db.bplaced.net/export/keydb_eng.zip')
sha256sums=('a18b1680802ccbd4fc6bb3463f34a787833e008f3f2676b8ef7773d931e54bf0')

package() {
    install -d "${pkgdir}/etc/xdg/aacs" || return 1
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg" || return 1
}
