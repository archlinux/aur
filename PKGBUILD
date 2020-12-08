# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-drivelib
pkgver=0.2.0
pkgrel=2
pkgdesc='Easy access to the most common Google Drive API calls'
url='https://github.com/Lykos153/python-drivelib'
license=('GPLv3+')
arch=('any')
depends=('python' 'python-google-api-python-client' 'python-google-auth-oauthlib' 'python-google-auth-httplib2' 'python-google-auth' 'python-oauth2client')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/Lykos153/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')


package() {
    cd "${srcdir}/${pkgname}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
