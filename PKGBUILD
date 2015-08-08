# previous Maintainer: PyroPeter <abi1789 @ googlemail . com>
# Maintainer: Alcasa <alcasa . mz @ googlemail . com>
pkgname=urxvt-vtwheel
pkgver=0.3
pkgrel=2
pkgdesc="Scroll wheel support for urxvt"
url="http://aur.archlinux.org/"
arch=('any')
license=('unknown')
depends=('bash' 'rxvt-unicode')
source=('vtwheel')
md5sums=('5d2fc11d40562be5721434a418c7e66f')

package() {
  install -Dm0664 "$srcdir/vtwheel" "$pkgdir/usr/lib/urxvt/perl/vtwheel"
}

# vim:set ts=2 sw=2 et:
