# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>
pkgname=obs-build
pkgver=2.5.0
pkgrel=1
pkgdesc="Building part of the OpenSUSE Build Service, osc-build"
url="http://build.opensuse.org"
arch=(any)
license=("GPL")
depends=(bash perl rpm-org xz)
source=("https://github.com/openSUSE/$pkgname/archive/obs_${pkgver}.tar.gz")
sha256sums=('98b6fe50367805e588c05ae47d78da576a753c5cc32861c99e559dcef79ef328')

package() {
  cd "$srcdir/$pkgname-obs_${pkgver}"
  make install DESTDIR="$pkgdir"
}
