# Maintainer: Étienne Deparis <etienne [at] depar.is>

pkgname=concierge
pkgver=0.2.1
pkgrel=1
pkgdesc='Think SASS for SSH config files'
license=('MIT')
url='https://github.com/9seconds/concierge'
depends=('python-inotify-simple' 'python-enum34')
makedepends=('python-setuptools')
optdepends=('concierge-jinja: jinja2 support in your templates'
            'concierge-mako: mako support in your templates')
source=("https://github.com/9seconds/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('06e54bd73dca7d8d48594906abbf70f77d7fea2003e5154ae77e75d388420d47')
arch=('any')
options=(!emptydirs)
install=concierge.install

package(){
  cd $srcdir/${pkgname}-$pkgver
  python setup.py install --root=$pkgdir
}
