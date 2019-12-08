# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.8.0
pkgrel=1
pkgdesc="EncFS gui and cli front-end"
arch=("any")
url="https://projects.deparis.io/projects/carp"
license=("WTFPL")
depends=("encfs" "python-gobject" "python-inotify>=0.2.9" "python-xdg")
optdepends=("rsync: sync support")
makedepends=("python-setuptools" "emacs")
source=("https://fossil.deparis.io/${pkgname}/tarball/${pkgver}.tar.gz")
sha256sums=('088f1d7b2d7a5fd747af5f03223992b69ffbd337a51b62afd5bd50533e6b58dd')

package() {
  cd "$srcdir/$pkgver"

  make dist DESTDIR="$pkgdir"
}
