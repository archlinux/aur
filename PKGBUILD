# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: rich_o <rich_o@lavabit.com>

pkgname=subdl
pkgver=1.1.0
pkgrel=1
pkgdesc="A command-line tool for downloading subtitles from opensubtitles.org"
arch=('any')
url="https://github.com/alexanderwink/$pkgname"
license=('GPL3')
depends=('python')
makedepends=('git')
source=(git+https://github.com/alexanderwink/subdl.git#commit=594fa59e6a40629f3b7dea6742c82a9d9399645c)
sha256sums=('SKIP')

package() {
  cd "${srcdir}"/$pkgname

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
