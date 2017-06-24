# Maintainer: joajfreitas <joaj.freitas@gmail.com>
pkgname=python-eddy
pkgver=0.2.7
pkgrel=1
pkgdesc=""
arch=('any')
url=""
license=('GPLv3')
groups=()
depends=('python-pypandoc'
        'python-markdown'
        'python-pygments'
        'python-jinja'
        'python-argparse'
        'python-yaml'
        'python-requests'
)
#Extra optional dependency: pyemdeb-markdown
optdepends=('python-py-gfm')
            
makedepends=('python' 'python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=($pkgname'::git+https://github.com/joajfreitas/eddy.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
