# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>

pkgname=obs-build
pkgver=20200122
_pkgname=$pkgver
pkgrel=1
pkgdesc="Building part of the OpenSUSE Build Service, osc-build"
url="http://build.opensuse.org"
url="https://github.com/openSUSE/obs-build"
arch=(any)
license=("GPL")
depends=(bash perl rpmextract xz)
source=("https://github.com/openSUSE/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('b7dc00e0fd7579b917d1ebfef372a99af69b46e064cbefc3cb99ab88f820f59e')

package() {
  cd "$srcdir/$pkgname-${pkgver}"
  make install DESTDIR="$pkgdir"
}
