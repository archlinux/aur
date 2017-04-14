# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Gryffyn
# Contributor: Tetsumi

pkgname=python-pygame
_name=pygame
pkgver=1.9.3
pkgrel=2
pkgdesc="Python game library"
arch=('i686' 'x86_64')
url="http://www.pygame.org"
license=('LGPL')
makedepends=('python-setuptools')
depends=('python' 'sdl_mixer' 'sdl_ttf' 'sdl_image' 'portmidi')
provides=('python-pygame')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

md5sums=('ac744ea6952b68d5f2b6d02a6d8e836c')

package() 
{
  cd ${_name}-${pkgver}
  python config.py -auto
  python setup.py install --root="${pkgdir}" --prefix=/usr
}
