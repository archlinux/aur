# Mantainer: Michael M. Tung <mtung at mat dot upv dot es>

pkgname=pandoc-panflute
pkgver=1.11
pkgrel=1
pkgdesc='A Python package that makes creating Pandoc filters fun.'
url='https://github.com/sergiocorreia/panflute'
depends=('pandoc' 'python' 'python-pandocfilters' 'python-shutilwhich' 'python-future')
license=('BSD3')
arch=('any')

makedepends=('git')
provides=('pandoc-panflute-git')
conflicts=('pandoc-panflute-git')

source=('git://github.com/sergiocorreia/panflute.git')
md5sums=('SKIP')

#pkgver() {
#  cd ${srcdir}/panflute
#  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

package() {
    cd "$srcdir/panflute"
    python setup.py install --root="$pkgdir" --optimize=1 
}
