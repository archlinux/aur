# Maintainer: Éric Gillet <eric+aur@linuxw.info>
pkgname=jungle-git
pkgver=1.1.11
pkgrel=1
pkgdesc="AWS operations by cli should be simpler"
arch=('any')
url="AWS operations by cli should be simpler"
license=('MIT')
depends=('python' 
         'python-boto3'
         'python-botocore'
         'python-click')
makedepends=('git' 'python-setuptools')
options=(!emptydirs)
source=('git+https://github.com/achiku/jungle.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/jungle"
  python setup.py install --root="$pkgdir/" --optimize=1
}
