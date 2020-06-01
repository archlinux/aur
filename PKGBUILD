# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=1.1
pkgrel=1
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('git-annex' 'python-annexremote' 'python-drivelib' 'python-tenacity' 'python-gitpython')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ab1ac8aff9c0c1eb9eec73fe808e5227c22494784a8677e7de2b2905a525d36e')



package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
