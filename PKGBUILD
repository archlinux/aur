# Maintainer: D. Can Celasun <can[at]dcc[dot]im>

pkgname=snowflake-odbc
pkgver=3.14.0
pkgrel=1
pkgdesc="ODBC Driver for Snowflake database"
arch=('x86_64')
url="http://www.snowflake.net/"
license=('custom: commercial')
install=snowflake-odbc.install
depends=(nss gcc-libs unixodbc)
source=(https://sfc-repo.snowflakecomputing.com/odbc/linux/${pkgver}/snowflake_linux_x8664_odbc-${pkgver}.tgz)
sha256sums=('d3a30f7990b518e5126ce1c299c1fc4f9cb01f71358fe9576f297fc3057f572f')

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/snowflake_odbc/"* "${pkgdir}/opt/${pkgname}" -R
}
