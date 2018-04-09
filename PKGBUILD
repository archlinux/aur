# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=0.10.2
pkgrel=2
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('python-annexremote' 'python-pydrive')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/git-annex-remote-googledrive/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('09ab1ff47c9dba42cb6cfc5528aca7be90ac345bfc865ca5cb72d951dcd29fd6')


package() {
    cd "${srcdir}/git-annex-remote-googledrive-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
