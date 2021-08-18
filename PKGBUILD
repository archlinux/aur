# Contributor: AlexTimmi <codelaunch@gmail.com>

pkgname=cqrlog-bin
pkgver=2.5.2
pkgrel=1
pkgdesc="An advanced ham radio logger based on MySQL database"
arch=('x86_64')
url="https://www.cqrlog.com"
license=('GPL2')
depends=('mariadb' 'libmariadbclient' 'mariadb-clients' 'hamlib' 'trustedqsl' 'xplanet' 'glabels' 'gtk2')
source_x86_64=("https://github.com/ok2cqr/cqrlog/releases/download/v${pkgver}/cqrlog_${pkgver}_amd64.tar.gz")
sha256sums_x86_64=('0bb82f7d3583e6e24b20da609e3e84b8d1b6bbea60e532c3aab439af196a44f5')

package() {
    cd ${pkgname%-bin}-${pkgver}
    cp -rfv ./* "$pkgdir"
}
