# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
_pkgname=AnnexRemote
pkgver=1.2.0
pkgrel=3
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/AnnexRemote/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2b49b84e4e118e27af3cce7e22e1755f38d78bc4728fad7a8dd6ad307e372061')


package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
