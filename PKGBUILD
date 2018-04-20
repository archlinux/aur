# Maintainer: Silvio Ankermann < silvio at booq dot org >

pkgname=git-annex-remote-googledrive
pkgver=0.10.4
pkgrel=3
pkgdesc='Faster git-annex special remote for Google Drive with support for exports'
url='https://github.com/Lykos153/git-annex-remote-googledrive'
license=('GPLv3+')
arch=('any')
depends=('python-annexremote' 'python-pydrive')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/42/8a/0c0c4b48709015b4f230d5f4f73270b81911efd1c3cee3249ba1e98d02cf/git-annex-remote-googledrive-0.10.4.tar.gz")
sha256sums=('12bf06a8cb74d2900e671e8564790d8f1b72746fe6b7520d8089b16d94627297')



package() {
    cd "${srcdir}/git-annex-remote-googledrive-${pkgver}"

    python setup.py install --optimize=1 "--root=${pkgdir}"
}
