# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
pkgver=1.1.1
pkgrel=2
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/AnnexRemote/archive/v${pkgver}.tar.gz")
sha256sums=('28865f66f3070988fa13ca227638c9c0b4aafd94e2d7041c1fe854e080c22776')


package() {
    cd "${srcdir}/AnnexRemote-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
