# Maintainer: Thomas Wucher <thomas.wucher@gtd-gmbh.de>

pkgname=mcdc-checker
pkgver=1.4.0
pkgrel=2
pkgdesc="A tool to check C/C++ source code for non tree-like binary decisions so that its MCDC test coverage can be assessed with GCov"
arch=(any)
url=https://gitlab.com/gtd-gmbh/mcdc-checker/mcdc-checker
license=("Mozilla Public License Version 2.0")
depends=("python>=3.10" "clang>=19.1.0")
source=("https://files.pythonhosted.org/packages/a2/57/9dc93efa8e328369b63a1e375aa3d1ae3aa5bc26379620d93bf59dc686be/${pkgname/-/_}-${pkgver}-py3-none-any.whl")
sha256sums=('c092b9ddd42c9362052e706ea59be19421a348b12e88ffaac6ff8eea872ba73b')

package() {
	python -m installer -d "$pkgdir" ${pkgname/-/_}-${pkgver}-py3-none-any.whl
}
