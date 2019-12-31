# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=0.11.4
pkgrel=2
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('git-annex' 'python-annexremote' 'python-pydrive' 'python-tenacity' 'python-oauth2client')
makedepends=('python-setuptools')
source=("https://github.com/Lykos153/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2849cacabf84cf6914e9087f0085a6572d5f3fc0a4f8c419af0b55cc08b4f439')



package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
