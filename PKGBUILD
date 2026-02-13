# Maintainer: yLDeveloper <yLDeveloper at outlook dot com>
# Contributor: yLDeveloper & Claude Code

pkgname=rnekod
pkgver=0.74
pkgrel=1
pkgdesc="Simple random catgirl image CLI fetcher from NekosAPI"
arch=('any')
url="https://github.com/SolynAcVersion/catgirl"
license=('MIT')
depends=(
  'python>=3.10'
  'python-requests'
  'python-pillow'
  'python-colorama'
)
makedepends=()
source=("https://raw.githubusercontent.com/SolynAcVersion/catgirl/main/catgirl.py")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/catgirl.py" "$pkgdir/usr/bin/rnekod"
}
