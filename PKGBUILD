# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=0.10.3
pkgrel=1
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('python-annexremote' 'python-pydrive')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/git-annex-remote-googledrive/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('78c7adb4f968c9636e4a42bba1097825fa2dd82aac51d2fa42d7d3d00f011954')


package() {
    cd "${srcdir}/git-annex-remote-googledrive-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
