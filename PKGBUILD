# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="anyzig"
pkgname="${_name}-symlinks"
pkgver=1
pkgrel=1
pkgdesc="One zig to rule them all (symlinks)"
arch=('any')
url="https://github.com/marler8997/${_name}"
license=('custom:None')
depends=('anyzig')
provides=('zig' 'zig-nightly')
conflicts=('zig')

package() {
  install -vd "${pkgdir}/usr/bin"
  ln -vsf "/usr/bin/anyzig" "${pkgdir}/usr/bin/zig"
}
