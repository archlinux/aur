# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
_pkgname=AnnexRemote
pkgver=1.4.1
pkgrel=1
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/AnnexRemote/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('f36702f32313b27c88c66ad5370cf389f576d452976aa66ec5d3289337142bf5')


package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
