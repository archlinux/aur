# Maintainer: Diego Garcia <diego.garcia.cr at gmail.com>
# Maintained at https://github.com/AmmoniumX/python-selenium-bin, feel free to submit patches

pkgname=python-selenium-bin
pkgver=4.29.0
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
  "https://files.pythonhosted.org/packages/2f/a6/fc66ea71ec0769f72abdf15cb9ec9269517abe68a160839383ddff7478f1/selenium-${pkgver}-py3-none-any.whl"

)
sha256sums=(
  "ce5d26f1ddc1111641113653af33694c13947dd36c2df09cdd33f554351d372e"
)

package() {
  python -m installer --destdir="${pkgdir}" "selenium-${pkgver}-py3-none-any.whl"
}
