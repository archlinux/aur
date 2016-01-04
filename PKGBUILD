# Maintainer: gryffyn

pkgbase=python-pygame
pkgname=python-pygame
pkgver=1.9.2pre.20141217
pkgrel=1
pkgdesc="Python game library"
arch=('i686' 'x86_64')
url="http://www.pygame.org"
license=('LGPL')
depends=('python' 'sdl_mixer' 'sdl_ttf' 'sdl_image' 'portmidi')
provides=('python-pygame')

source=(https://bitbucket.org/pygame/pygame/get/fsencoding-ascii.tar.gz)

sha1sums=('bee829579e5c08703351a7792b2648726a7798d7')

package() 
{
  cd pygame-pygame-64f9038c292d
  python config.py -auto
  python setup.py install --root="${pkgdir}" --prefix=/usr
}
