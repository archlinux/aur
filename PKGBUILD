# Maintainer: Diego Garcia <diego.garcia.cr at gmail.com>
# Maintained at https://github.com/AmmoniumX/python-selenium-bin, feel free to submit patches

pkgname=python-selenium-bin
pkgver=4.28.1
pkgrel=1
pkgdesc="Python language bindings for Selenium WebDriver"
arch=(x86_64)
url="https://github.com/SeleniumHQ/selenium"
license=(Apache-2.0)
depends=(
  bzip2
  gcc-libs
  glibc
  python
  python-certifi
  python-trio
  python-trio-websocket
  python-typing_extensions
  python-urllib3
  python-websocket-client
  zlib
)
makedepends=(python-installer)
conflicts=(python-selenium)
provides=(python-selenium)
options=(!lto)
source=(
  "https://files.pythonhosted.org/packages/a0/9f/34d0ec09b0dd6fb7b08b93eb4b7b80049e0b9db0ba7f81ad814c9be78b8f/selenium-${pkgver}-py3-none-any.whl"

)
sha256sums=(
  "4238847e45e24e4472cfcf3554427512c7aab9443396435b1623ef406fff1cc1"
)

package() {
  python -m installer --destdir="${pkgdir}" "selenium-${pkgver}-py3-none-any.whl"
}
