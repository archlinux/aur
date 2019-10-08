# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=ms-ivy
pkgname="python2-${_pkgname}"
pkgver=0.3
pkgrel=1
pkgdesc="Tool for specifying, modeling, implementing and verifying protcols."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('LGPLv3')
depends=('python2' 'python2-ply' 'python2-tarjan')
makedepends=('python2-pip')
source=("https://files.pythonhosted.org/packages/55/5d/9141919ef2d066bdfbac2862be9e17f8ffd2730f765eca2596772a688bb0/${_pkgname//-/_}-${pkgver}-py2-none-manylinux1_x86_64.whl")
sha256sums=('92b5f022e0f47bbf8d83ce397bb5c7197d65d934441f6bc2b50859595d1f92ae')

package() {
  pip2 install --root="${pkgdir}" --no-warn-script-location "${_pkgname//-/_}-${pkgver}"-*.whl
}
