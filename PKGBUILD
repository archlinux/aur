# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=snowflake-odbc
pkgver=3.11.0
pkgrel=1
pkgdesc="ODBC Driver for Snowflake database"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom: commercial')
install=snowflake-odbc.install
depends=(nss gcc-libs unixodbc)
source=(https://sfc-repo.snowflakecomputing.com/odbc/linux/${pkgver}/snowflake_linux_x8664_odbc-${pkgver}.tgz)
sha256sums=('f9cbaac8ef3010bf7ff50ac53b6b06c7fc107a48fba77a0e7cbf52c72caf7244')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/snowflake_odbc/"* "${pkgdir}/opt/${pkgname}" -R
}
