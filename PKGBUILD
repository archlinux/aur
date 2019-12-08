# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.8.1
pkgrel=1
pkgdesc="EncFS gui and cli front-end"
arch=("any")
url="https://projects.deparis.io/projects/carp"
license=("WTFPL")
depends=("encfs" "python-gobject" "python-inotify>=0.2.9" "python-xdg")
optdepends=("rsync: sync support")
makedepends=("python-setuptools" "emacs")
source=("https://fossil.deparis.io/${pkgname}/tarball/${pkgver}.tar.gz")
sha256sums=('b6cbd562338e62f60c0f3684ed4e21cc77130c2c6dfb9f5e8cde31eb51543575')

package() {
  cd "$srcdir/$pkgver"

  make dist DESTDIR="$pkgdir"
}
