# Maintainer:  M0Rf30

pkgname=hyde-git
pkgver=510.696adac
pkgrel=1
pkgdesc="Hyde is a static website generator powered by Python & Django."
url="http://ringce.com/hyde"
arch=(any)
license=('MIT')
depends=('python2' 'python2-distribute' 'python-markdown' 'python2-django' 'python2-yaml' 'python2-pyrss2gen' 'python2-cherrypy' 'python2-pygments' 'python2-fswrap' 'python2-typogrify' 'python2-commando' 'python2-smartypants')
makedepends=('python2' 'git')
conflicts=(hyde)
source=('hyde::git://github.com/hyde/hyde.git')

package() {
   cd hyde
   python2 setup.py install --root=$pkgdir/ --optimize=1
  
}

pkgver() {
  cd hyde
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
