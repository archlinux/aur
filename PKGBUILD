# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=0.11
pkgrel=1
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('python-annexremote' 'python-pydrive')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('df8a6ffc74d1e909b13fde92c3773aabae0c30550ef5d3463748cd91201ad19b')



package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
