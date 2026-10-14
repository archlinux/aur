# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
pkgname=aacs-keydb-daily
pkgver=20261014001624
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
provides=("${pkgname%-daily}")
conflicts=("${pkgname%-daily}")
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('9613acaa2996d9e457b9c677a63276673d78401e1f5be9e45c42ec141b50a9ed')

package() {
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg"
}
