# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: rich_o <rich_o@lavabit.com>

pkgname=subdl
pkgver=1.0.3
pkgrel=4
pkgdesc="A command-line tool for downloading subtitles from opensubtitles.org"
arch=('any')
url="https://github.com/akexakex/$pkgname"
license=('GPL3')
depends=('python2')
makedepends=('git')
source=(git+https://github.com/akexakex/subdl.git#commit=dd6ddb6)
sha256sums=('SKIP')

package() {
  cd "${srcdir}"/$pkgname

  sed -i 's|usr/bin/python$|\02|' $pkgname

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
}
