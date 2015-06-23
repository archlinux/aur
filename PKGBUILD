# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Mike Lenzen <lenzenmi@gmail.com>
pkgname=python-encfswrapper-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A command-line tool to mount encrypted encfs filesystem while another program runs" 
arch=('i686' 'x86_64')
url="https://github.com/lenzenmi/encfswrapper"
license=('GPL3')
depends=('python' 'encfs')
conflicts=('python-encfswraper')
provides=('python-encfswrapper')
source=(master::'git://github.com/lenzenmi/encfswrapper.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/master"
  python setup.py install --root="$pkgdir/" --optimize=1
}



# vim:set ts=2 sw=2 et:
