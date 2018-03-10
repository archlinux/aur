# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=0.9
pkgrel=1
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('python-annexremote' 'python-pydrive')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/git-annex-remote-googledrive/archive/v${pkgver}.zip")
sha256sums=('797f026c4e9f9f924ced683a99d98111825872528d459656b8c05be11075419b')


package() {
    cd "${srcdir}/git-annex-remote-googledrive-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
