# Maintainer: gudzpoz <gudzpoz at live dot com>

pkgname=apl-bin
pkgver=1.9
_deb_pkgrel=1
pkgrel=1
pkgdesc="GNU APL interpreter and library for array programming (ISO 13751)"
arch=('x86_64')
url="https://www.gnu.org/software/apl/"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'ncurses' 'cairo' 'fftw' 'gtk3' 'pcre2' 'libpng' 'sqlite3' 'libx11' 'libxcb' 'postgresql-libs')
provides=('apl' 'gnu-apl')
conflicts=('apl' 'gnu-apl')
source=("https://ftpmirror.gnu.org/gnu/apl/apl_${pkgver}-${_deb_pkgrel}_amd64.deb")
sha256sums=('5018e1c96a320fc2746c9d0129f53b8ab16f984fddb47e2e475b8b84dc08a365')

package() {
  bsdtar -xf "${srcdir}"/data.tar.zst -C "${pkgdir}/"
}
