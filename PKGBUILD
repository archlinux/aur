# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Chris Tusa <linisys@gmail.com>
# Contributor: Thore Bunde <root [at] netpimp [dot] de>

pkgname='yum-metadata-parser'
pkgver='1.1.4'
pkgrel=9
pkgdesc='C-based metadata parser to quickly parse xml metadata into sqlite databases.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://yum.baseurl.org/download/yum-metadata-parser/'
depends=('python2' 'libxml2'  'glib2')
makedepends=('python2-pip')
source=('http://yum.baseurl.org/download/yum-metadata-parser/yum-metadata-parser-1.1.4.tar.gz')
sha256sums=('f1560a284541feb720c3ae35b6b31f80c2be5cb9ca86b3a1ee9459846f821ada')

package() {
          cd "${srcdir}/${pkgname}-${pkgver}"
          pip2 install . --isolated --root="${pkgdir}" --no-deps --ignore-installed --build .
}


