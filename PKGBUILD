# Maintainer: Diego Garcia <diego.garcia.cr at gmail.com>
# Maintained at https://github.com/AmmoniumX/python-selenium-bin, feel free to submit patches

pkgname=python-selenium-bin
pkgver=4.35.0
pkgrel=1
pkgdesc="Python language bindings for Selenium WebDriver (build from wheel)"
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
  "https://files.pythonhosted.org/packages/17/ef/d0e033e1b3f19a0325ce03863b68d709780908381135fc0f9436dea76a7b/selenium-${pkgver}-py3-none-any.whl"

)
sha256sums=(
  "90bb6c6091fa55805785cf1660fa1e2176220475ccdb466190f654ef8eef6114"
)

package() {
  python -m installer --destdir="${pkgdir}" "selenium-${pkgver}-py3-none-any.whl"
}
