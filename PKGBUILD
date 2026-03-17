# Maintainer: DeepChirp <DeepChirp@outlook.com>
pkgname=aacs-keydb-daily
pkgver=20260317002725
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
provides=("${pkgname%-daily}")
conflicts=("${pkgname%-daily}")
source=('keydb_eng-20260317002725.zip::https://web.archive.org/web/20260317002725/https://fvonline-db.bplaced.net/export/keydb_eng.zip')
sha256sums=('d99eef96d9506e7d7a33bf98a0fc2ac24f65d035ff4a467f11d4f1a0cce86a60')

package() {
    install -d "${pkgdir}/etc/xdg/aacs"
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg"
}
