# Maintainer: Thomas Wucher <thomas.wucher@gtd-gmbh.de>

pkgname=mcdc-checker
pkgver=1.4.1
pkgrel=1
pkgdesc="A tool to check C/C++ source code for non tree-like binary decisions so that its MCDC test coverage can be assessed with GCov"
arch=(any)
url=https://gitlab.com/gtd-gmbh/mcdc-checker/mcdc-checker
license=("Mozilla Public License Version 2.0")
depends=("python>=3.10" "clang>=19.1.0")
source=("https://files.pythonhosted.org/packages/62/db/222630f6b5e1ba36d36ab92f01cd26853dca07afab35ce417ef4ef4cb7cd/${pkgname/-/_}-${pkgver}-py3-none-any.whl")
sha256sums=('7933999a5ca542c134c4a8289e1e79b939113223bfd441aff7c89b117410f077')

package() {
	python -m installer -d "$pkgdir" ${pkgname/-/_}-${pkgver}-py3-none-any.whl
}
