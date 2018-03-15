# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
pkgver=1.1
pkgrel=1
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/AnnexRemote/archive/v${pkgver}.zip")
sha256sums=('54322bdfbc8d2ef601429f71b1d98822b5188c21d84cc86c3e572b52fab80c80')


package() {
    cd "${srcdir}/AnnexRemote-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
