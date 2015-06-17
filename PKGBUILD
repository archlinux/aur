#Mantainer: M0Rf30
pkgname=wp-download-git
pkgver=18.13abbc8
pkgrel=1
pkgdesc="Wikipedia Dump Downloader"
url="http://packages.python.org/wp-download/"
arch=('i686' 'x86_64')   
makedepends=(git)
depends=('python2' 'python2-progressbar') 
license=(GPL3)
source=("wpdown::git://github.com/babilen/wp-download.git")

package() {
  cd wpdown
  python2 setup.py install --root=$pkgdir --prefix=/usr

}

pkgver() {
    cd wpdown
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
