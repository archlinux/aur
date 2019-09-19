# Maintainer: Ivan Semkin (ivan at semkin dot ru)

appname=VK-Songs
pkgname=vk-songs
pkgver=0.1.1
pkgrel=1
pkgdesc='Downloads VK songs'
arch=('any')
url='https://github.com/vanyasem/VK-Songs'
license=('GPL3')
depends=('python-vk_api' 'python' 'python-requests' 'python-pyfiglet' 'python-prompt_toolkit' 'python-colorama' 'python-pathvalidate' 'python-pyinquirer' 'python-magic')
makedepends=('python-setuptools')
provides=('vk-songs')
conflicts=('vk-songs')
source=("https://github.com/vanyasem/VK-Songs/archive/v$pkgver.tar.gz")
sha256sums=('c67ec6c59b50eff8cfdca75ae97e7cd4d377e5fee770ef29244cbca796a36ab6')

package() {
  cd "$srcdir/$appname-$pkgver"
  python3 setup.py install --optimize=1 --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
