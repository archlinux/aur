# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
pkgname=aacs-keydb-daily
pkgver=20260909002955
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
provides=("${pkgname%-daily}")
conflicts=("${pkgname%-daily}")
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('92a201dfcc53233d2fd1b60e1b94a09550d5f465eec515ab954e546d0c1dc08d')

package() {
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg"
}
