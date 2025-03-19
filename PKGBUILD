# Maintainer: Thomas Wucher <thomas.wucher@gtd-gmbh.de>

pkgname=mcdc-checker
pkgver=1.5.0
pkgrel=1
pkgdesc="A tool to check C/C++ source code for non tree-like binary decisions so that its MCDC test coverage can be assessed with GCov"
arch=(any)
url=https://gitlab.com/gtd-gmbh/mcdc-checker/mcdc-checker
license=("Mozilla Public License Version 2.0")
depends=("python>=3.10" "clang>=19.1.0")
source=("https://files.pythonhosted.org/packages/61/50/ebd094c4f6ad24d84f934b16915a7013e177cd679a3b987c9f3b8eac62f3/${pkgname/-/_}-${pkgver}-py3-none-any.whl")
sha256sums=('a711a223b7249999a71f03df4d59fabebd82d0b2a00b36890a82a442bd70c431')

package() {
	python -m installer -d "$pkgdir" ${pkgname/-/_}-${pkgver}-py3-none-any.whl
}
