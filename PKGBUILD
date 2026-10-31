# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=freelance-time-cli
pkgver=1.0.0+r19.b8b2254
pkgrel=1
_repo=freelance-time-cli
_commit=b8b22544e43afa6ea6be34a18e7f434471c137ea
_srcdir="$_repo-$_commit"
pkgdesc="Track billable hours per project from the command line. Zero dependencies, local JSON file, no cloud account"
arch=('any')
url="https://github.com/kleogeos/freelance-time-cli"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kleogeos/freelance-time-cli/archive/$_commit.tar.gz")
sha256sums=('84c9eb82b7b0579725abacd4541951d468d647960a9ab2234094443c503ace23')

package() {
	cd "$_srcdir"
	install -Dm755 track.py "$pkgdir/usr/bin/freelance-time"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
