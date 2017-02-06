# Maintainer: Samantha Baldwin <fuhsaz 'plus' aur 'at' cryptic 'dot' li>
pkgname=mktoc
pkgver=1.3
pkgrel=2
pkgdesc="Simple command line tool to create TOC files for CD burning with cdrdao"
arch=('any')
url="https://pythonhosted.org/mktoc/"
license=('GPL')
depends=('python2' 'python2-setuptools' 'python2-chardet')
options=(!emptydirs)
source=("https://github.com/cmcginty/mktoc/raw/master/dist/${pkgname}-${pkgver}.tar.gz")
md5sums=('2eabcdc8c9433d1a398e113b8a8299b4')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
