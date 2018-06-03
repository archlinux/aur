pkgname=i3ipc-python
pkgver=1.5.1
pkgrel=2
pkgdesc='An improved Python library to control i3wm'
arch=('any')
url="https://github.com/acrisci/${pkgname}"
license=('custom:BSD')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/acrisci/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('5b638bedcc4c690e270390a815d1b680585935c82ce8295cac774d72bbcf444b3ba68f7259cfe02539f493694aefcb7894c8f84ff5aa88a464f477ee6d3b8692')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
