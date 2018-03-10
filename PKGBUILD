# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
pkgver=1.0
pkgrel=2
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/AnnexRemote/archive/v${pkgver}.zip")
sha256sums=('bbccd4eb1704a83a0318e9ec65f6c334dc932b2f3f235aa445e5cd991cc2f737')


package() {
    cd "${srcdir}/AnnexRemote-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
