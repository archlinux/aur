# Maintainer: Kareem Khazem <karkhaz at karkhaz dot com>

pkgname=python-pytest-docs
pkgver=8.3
pkgrel=1
pkgdesc="Documentation for Python Pytest package"
arch=("x86_64")
url="https://docs.pytest.org/"
license=("MIT")
source=("${pkgname}-${pkgver}.zip::https://docs.pytest.org/_/downloads/en/${pkgver}.x/htmlzip/")
sha256sums=('9176061eb2b047fc17f3e98bbec73b0dfe923f16c00b7f906614411cd12cac76')

package() {
	install -d "${pkgdir}"/usr/share/doc/python-pytest/html
	cp -a pytest-${pkgver}.x/* "${pkgdir}"/usr/share/doc/python-pytest/html/
}
# vim:set ts=4 sw=4 et:
