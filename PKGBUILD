# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=snowflake-odbc
pkgver=3.12.0
pkgrel=1
pkgdesc="ODBC Driver for Snowflake database"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom: commercial')
install=snowflake-odbc.install
depends=(nss gcc-libs unixodbc)
source=(https://sfc-repo.snowflakecomputing.com/odbc/linux/${pkgver}/snowflake_linux_x8664_odbc-${pkgver}.tgz)
sha256sums=('23429085d0f788e15c5b17ae9709e229d1c4459d489dacf0369ecf42b1884990')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/snowflake_odbc/"* "${pkgdir}/opt/${pkgname}" -R
}
