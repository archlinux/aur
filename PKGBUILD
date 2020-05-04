# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: PyroPeter <abi1789 @ googlemail . com>
# Contributor: Alcasa <alcasa . mz @ googlemail . com>
pkgname=urxvt-vtwheel
pkgver=0.3
pkgrel=3
pkgdesc="Scroll wheel support for urxvt"
url="https://aur.archlinux.org/"
arch=('any')
license=('unknown')
depends=('bash' 'rxvt-unicode')
source=('vtwheel')
sha256sums=('3694dc506f2e69998738549c5359f08b00ce4921b3c6e1f90d2a50e931cc549d')

package() {
  install -Dm0664 "$srcdir/vtwheel" "$pkgdir/usr/lib/urxvt/perl/vtwheel"
}

# vim:set ts=2 sw=2 et:
