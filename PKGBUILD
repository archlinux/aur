pkgname=('cmsis-svd-git')
pkgver=0.4
pkgrel=1
pkgdesc='Aggegration of ARM Cortex-M CMSIS SVDs and related tools'
arch=('any')
url='https://github.com/posborne/cmsis-svd'
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=('cmsis-svd::git+https://github.com/posborne/cmsis-svd')
md5sums=('SKIP')

package() {
    cd cmsis-svd/python
    python setup.py bdist
    cd $pkgdir
    tar -xzvf $srcdir/cmsis-svd/python/dist/cmsis-svd-*.tar.gz
}
