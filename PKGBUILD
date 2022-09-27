# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: rich_o <rich_o@lavabit.com>

pkgname=subdl
pkgver=1.1.2
pkgrel=3
pkgdesc="A command-line tool for downloading subtitles from opensubtitles.org"
arch=('any')
url="https://github.com/alexanderwink/$pkgname"
license=('GPL3')
depends=('python')
optdepends=('python-chardet: encoding detector')
makedepends=('git')
source=(git+https://github.com/alexanderwink/subdl.git#commit=da2398546c33da1665dbc2d985b30d959c6f5a0c)
sha256sums=('SKIP')

package() {
  cd "${srcdir}"/$pkgname

  install -Dm755 $pkgname.py "${pkgdir}"/usr/bin/$pkgname
}
