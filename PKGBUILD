# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=python-annexremote
pkgver=1.0
_pkgver=1.0.post2
pkgrel=1
pkgdesc='git annex special remotes made easy'
url='https://github.com/Lykos153/AnnexRemote'
license=('GPLv3+')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/a4/c0/b20c623bfeacbc41e49c71644baa610bcc2a345e47c5951093766f9e59c7/annexremote-${_pkgver}.tar.gz")
sha256sums=('87eb9ba4eba4244ee450828a35719571f771dacda5d8b0ccad7bf37338c19f0a')


package() {
    cd "${srcdir}/annexremote-${_pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
