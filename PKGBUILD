# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=0.10.2
pkgrel=1
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('python-annexremote' 'python-pydrive')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/git-annex-remote-googledrive/archive/v${pkgver}.tar.gz")
sha256sums=('1e38ee310062ba44118849a955ddfc74aa1183869012e5c7d2cfab9ea331c997')


package() {
    cd "${srcdir}/git-annex-remote-googledrive-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
