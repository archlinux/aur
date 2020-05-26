# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
_pkgname=AnnexRemote
pkgver=1.4.3
pkgrel=1
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/AnnexRemote/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ffac51c472c0b51c5114cebb17cbb614cdb8118edd334d87061fa81171af5304')


package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
