# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname="python2-xstatic-angular-bootstrap"
pkgver=0.11.0.3
pkgrel=1
pkgdesc="XStatic-Angular-Bootstrap"
arch=("i686" "x86_64")
url="http://githubranking.com/stackforge/xstatic-angular-bootstrap"
depends=("python2")
makedepends=("python2-setuptools" "python2-pip")
source=("https://github.com/stackforge/xstatic-angular-bootstrap/archive/${pkgver}.tar.gz")
md5sums=('581488c5f3190f978e77431c370d047c')

package() {
  pip2 install --root ${pkgdir} ${pkgver}.tar.gz
}
