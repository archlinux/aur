# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=1.1.1
pkgrel=1
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('git-annex' 'python-annexremote' 'python-drivelib' 'python-tenacity' 'python-gitpython')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0cb7d33096eed2290935b53d4b135ea1c379da3eede7d32d92c627d295c456c5')



package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
