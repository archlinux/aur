# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=snowflake-odbc
pkgver=3.19.0
pkgrel=1
pkgdesc="ODBC Driver for Snowflake database"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom: commercial')
install=snowflake-odbc.install
depends=(nss gcc-libs unixodbc)
source=(https://sfc-repo.snowflakecomputing.com/odbc/linux/${pkgver}/snowflake_linux_x8664_odbc-${pkgver}.tgz)
sha256sums=('590cf901d5bcc27fd91d3b8b4bbaf417a64348931da18ad5392554e85066afe7')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/snowflake_odbc/"* "${pkgdir}/opt/${pkgname}" -R
}
