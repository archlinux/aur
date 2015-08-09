# Maintainer: Miguel Useche <migueluseche(dot)skatox.com>
pkgname=turpial
pkgver=1.6.8
pkgrel=1
pkgdesc="A multi-interface Twitter client written in Python."
arch=(any)
url="http://turpial.org.ve/"
license=('GPL3')
depends=('python2' 'python2-distribute' 'python-simplejson>=1.9.2' 'pygtk>=2.12' 'python-notify>=0.1.1' 'notification-daemon' 'gstreamer0.10-python' 'python-babel>=0.9.1' 
'pywebkitgtk')
optdepends=('python2-gtkspell>=2.25.3' 'gnome-spell' 'aspell')
conflicts=('turpial')
source=(http://turpial.org.ve/files/sources/stable/$pkgname-$pkgver.tar.gz)
md5sums=('04bdd05c3aca2f6ee4ff1f6d95e64b30')

build() {
  cd $srcdir/$pkgname-${pkgver//_/-}
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}