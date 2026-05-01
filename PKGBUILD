# Maintainer: Dasun P
pkgname=tablio-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Open-source desktop database client for PostgreSQL, MySQL, MariaDB, SQLite, CockroachDB, TiDB, and Cassandra/ScyllaDB"
arch=('x86_64')
url="https://github.com/dasunNimantha/tablio"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'libayatana-appindicator')
provides=('tablio')
conflicts=('tablio')
install=tablio-bin.install
source=("${url}/releases/download/v${pkgver}/Tablio_${pkgver}_amd64.deb"
        "tablio-bin.install")
sha256sums=('SKIP'
            'SKIP')

package() {
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}/"
}
