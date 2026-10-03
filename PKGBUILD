# Maintainer: DeepChirp <deepchirp@archlinuxcn.org>
pkgname=aacs-keydb-daily
pkgver=20261003000622
pkgrel=1
pkgdesc='Contains the Key Database for the AACS Library (Daily Updates)'
arch=('any')
url='http://fvonline-db.bplaced.net/'
depends=('libaacs')
provides=("${pkgname%-daily}")
conflicts=("${pkgname%-daily}")
source=("keydb_eng-${pkgver}.zip::https://web.archive.org/web/${pkgver}/http://fvonline-db.bplaced.net/export/keydb_eng.zip")
sha256sums=('0cb70ee80871486cb645eb4e366ac4ec9359b9b0f88803850faa337b440314c9')

package() {
    install -Dm644 "${srcdir}/keydb.cfg" "${pkgdir}/etc/xdg/aacs/KEYDB.cfg"
}
