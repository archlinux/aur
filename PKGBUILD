# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=pootle
pkgver=2.5.1
pkgrel=1
pkgdesc="An online translation management tool with translation interface"
arch=('any')
url="http://pootle.translatehouse.org"
license=('GPL')
depends=('python2-setuptools' 'translate-toolkit' 'python2-cssmin' 'python2-django-assets' 'python2-webassets-0.10'
         'python2-argparse' 'python2-south-0.7' 'django-taggit' 'django-voting-0.1' 'django-1.4')
source=(http://sourceforge.net/projects/translate/files/Pootle/$pkgver/Pootle-$pkgver.tar.bz2)
sha256sums=('524743972edd20fd63c3bedbb250007147ee63ed20568857dbe5e711b524aa9e')

package() {
  cd "${srcdir}"/Pootle-$pkgver

  python2 setup.py install --root="${pkgdir}"  --optimize=1
}
