# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=wgetpkg
pkgver=0.1.0
pkgrel=2
pkgdesc="Downloads AUR packages with wget"
arch=('any')
depends=('wget')
url="https://github.com/atweiden/wgetpkg"
license=('UNLICENSE')
source=(wgetpkg)
sha256sums=('8a74204727bd752f0bfd90a8eb5f567456c148d3540ae86632c66c762e9bf63d')
provides=('wgetpkg')

package() {
  msg 'Installing executable...'
  install -D -m755 "$srcdir/wgetpkg" "${pkgdir}/usr/bin/wgetpkg"
}
