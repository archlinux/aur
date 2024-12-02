# Maintainer: Diego Garcia <diego.garcia.cr at gmail.com>
# Maintained at https://github.com/AmmoniumX/python-selenium-bin, feel free to submit patches

pkgname=python-selenium-bin
pkgver=4.27.1
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
  "https://files.pythonhosted.org/packages/a6/1e/5f1a5dd2a28528c4b3ec6e076b58e4c035810c805328f9936123283ca14e/selenium-${pkgver}-py3-none-any.whl"

)
sha256sums=(
  "b89b1f62b5cfe8025868556fe82360d6b649d464f75d2655cb966c8f8447ea18"
)

package() {
  python -m installer --destdir="${pkgdir}" "selenium-${pkgver}-py3-none-any.whl"
}
