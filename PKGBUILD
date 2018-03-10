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
source=("https://files.pythonhosted.org/packages/15/f5/592e71a9a2aaedf2f22dac66173b2eb972aa87c4c6cfe1bb23033632975c/git-annex-remote-googledrive-0.9.tar.gz")
sha256sums=('4ebabd7ed31754d4f63e9383b984610d1adf4b12b7403ec15a3bb9496a7c4402')


package() {
    cd "${srcdir}/git-annex-remote-googledrive-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
