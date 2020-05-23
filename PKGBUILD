# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
_pkgname=AnnexRemote
pkgver=1.4.2
pkgrel=1
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/AnnexRemote/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('bd3f56920f285d465db150d70d8ac94df1a01cd118e8111176158fcd76724bca')


package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
