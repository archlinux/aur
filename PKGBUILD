# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
_pkgname=AnnexRemote
pkgver=1.6.0
pkgrel=1
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/Lykos153/${_pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')


package() {
    cd "${srcdir}/${_pkgname}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
