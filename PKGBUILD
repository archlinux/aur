# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
pkgver=1.1.1
pkgrel=1
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/AnnexRemote/archive/v${pkgver}.tar.gz")
sha256sums=('7cecdf7835e544e31a121f37ce636e0dc10327dc92e8d1dbe85a7d68ad33e348')


package() {
    cd "${srcdir}/AnnexRemote-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
