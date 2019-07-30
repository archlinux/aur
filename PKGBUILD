# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=snowflake-odbc
pkgver=2.19.9
pkgrel=1
pkgdesc="ODBC Driver for Snowflake database"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom: commercial')
install=snowflake-odbc.install
depends=(nss gcc-libs unixodbc)
source=(https://sfc-repo.snowflakecomputing.com/odbc/linux/2.19.9/snowflake_linux_x8664_odbc-${pkgver}.tgz)
md5sums=('ae5d3120fbf73afd1959471b9b4ba47e')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/snowflake_odbc/"* "${pkgdir}/opt/${pkgname}" -R
}
