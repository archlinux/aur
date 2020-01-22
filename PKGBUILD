# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: rich_o <rich_o@lavabit.com>

pkgname=subdl
pkgver=1.1.2
pkgrel=2
pkgdesc="A command-line tool for downloading subtitles from opensubtitles.org"
arch=('any')
url="https://github.com/alexanderwink/$pkgname"
license=('GPL3')
depends=('python')
makedepends=('git')
source=(git+https://github.com/alexanderwink/subdl.git#commit=63b3caf2f6b2bd1a6ebc9277e9d72d3b6c2f0e30)
sha256sums=('SKIP')

package() {
  cd "${srcdir}"/$pkgname

  install -Dm755 $pkgname.py "${pkgdir}"/usr/bin/$pkgname
}
