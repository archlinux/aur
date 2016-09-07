# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: rich_o <rich_o@lavabit.com>

pkgname=subdl
pkgver=1.0.3
pkgrel=6
pkgdesc="A command-line tool for downloading subtitles from opensubtitles.org"
arch=('any')
url="https://github.com/alexanderwink/$pkgname"
license=('GPL3')
depends=('python')
makedepends=('git')
source=(git+https://github.com/alexanderwink/subdl.git#commit=d9478cc)
sha256sums=('SKIP')

package() {
  cd "${srcdir}"/$pkgname

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
