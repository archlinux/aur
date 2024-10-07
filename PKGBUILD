# Maintainer: Thomas Wucher <thomas.wucher@gtd-gmbh.de>

pkgname=mcdc-checker
pkgver=1.4.0
pkgrel=1
pkgdesc="A tool to check C/C++ source code for non tree-like binary decisions so that its MCDC test coverage can be assessed with GCov"
arch=(any)
url=https://gitlab.com/gtd-gmbh/mcdc-checker/mcdc-checker
license=("Mozilla Public License Version 2.0")
depends=("python>=3.10" "clang>=19.1.0")
source=("https://gitlab.com/gtd-gmbh/${pkgname}/${pkgname}/-/jobs/8011273687/artifacts/raw/dist/${pkgname/-/_}-${pkgver}-py3-none-any.whl")
sha256sums=('a9b7feec55bc7356280942e76323df1a7c1d6371e069a451d95819451bfda03e')

package() {
	python -m installer -d "$pkgdir" ${pkgname/-/_}-${pkgver}-py3-none-any.whl
}
