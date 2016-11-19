# Maintainer : Antoine Carpentier
pkgname=babel2
pkgver=2
pkgrel=2
pkgdesc="A framework for FCG, IRL and multi-agent language game in Common Lisp"
arch=('any')
url="http://emergent-languages.org/Babel2/"
license=("apache")
depends=('asdf')
optdepends=('sbcl' 'ccl-svn' 'gnuplot' 'graphviz')
makedepends=('unzip')
source=("http://emergent-languages.org/Babel2/downloads/Babel2.zip")
sha256sums=('0cba17a79a365c8cdc5c49be4a13cbf2c22ef22c3fb1f28b1957a67237d4e0f8')
install=$pkgname.install

package()
{
  mkdir -p $pkgdir/usr/lib/
  unzip Babel2.zip -d $pkgdir/usr/lib
  mkdir -p $pkgdir/etc/default
  echo -ne "(load \"/usr/lib/$pkgname/init-babel\")\n" > $pkgdir/etc/default/$pkgname
}

# vim:set ts=2 sw=2 et:

