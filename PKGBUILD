# Maintainer: Diego Garcia <diego.garcia.cr at gmail.com>
# Maintained at https://github.com/AmmoniumX/python-selenium-bin, feel free to submit patches

pkgname=python-selenium-bin
pkgver=4.26.1
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
  "https://files.pythonhosted.org/packages/91/08/10cff8463b3510b78f9e3dcef6b37c542b06d71ed1240a8940ba0c75d3bc/selenium-${pkgver}-py3-none-any.whl"
)
sha256sums=(
  "1db3f3a0cd5bb07624fa8a3905a6fdde1595a42185a0617077c361dc53d104fb"
)

package() {
  python -m installer --destdir="${pkgdir}" "selenium-${pkgver}-py3-none-any.whl"
}
