# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
pkgver=1.0.1
pkgrel=1
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/AnnexRemote/archive/v${pkgver}.zip")
sha256sums=('ec90128c807187a2eb156e3d242b9ece502d82eeefa89e9c33ca6086852f0ae5')


package() {
    cd "${srcdir}/AnnexRemote-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
