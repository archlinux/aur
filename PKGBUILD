# Maintainer: Ben Copeland <ben at copeland dot me dot uk>
# Contributor: Douglas Campos <qmx at qmx dot me>

pkgname=python2-cli53
pkgver=0.4.4
pkgrel=1
pkgdesc="Command line script to administer the Amazon Route 53 DNS service"
arch=("any")
url="https://github.com/barnybug/cli53"
license=('BSD')
groups=()
depends=()
makedepends=('python2-pip')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=()
md5sums=()

package() {
  pip2 install -t "$pkgdir" "cli53==$pkgver"
}

# vim:set ts=2 sw=2 et:
