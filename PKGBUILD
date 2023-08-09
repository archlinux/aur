# Maintainer : blubbblubb <lampadada[removeme][at]googlemail[dot]com>

pkgbase=boxicons-fonts
_pkgbase=boxicons
pkgname=(ttf-boxicons woff-boxicons woff2-boxicons)
pkgver=2.1.4
commit=9ffa9136e8681886bb7bd2145cd4098717ce1c11
pkgrel=1
pkgdesc="High Quality web friendly icons"
url="https://boxicons.com"
license=('MIT')
arch=('any')
depends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/atisawd/${_pkgbase}/archive/${commit}.tar.gz")
sha512sums=('84df396e9c698f57cee43eb5dbec3dd9830943588708e91bf65b4ef7631516f546241cd21e8fde6c0f3c6ab554e7d29a52704ba71d3676e4c08a1ba32abb7494')

package_ttf-boxicons() {
  pwd
  cd "${_pkgbase}-${commit}/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 ./fonts/${_pkgbase}.ttf "$pkgdir/usr/share/fonts/TTF"
}

package_woff-boxicons() {
  cd "${_pkgbase}-${commit}/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d "$pkgdir/usr/share/fonts/WOFF"
  install -m644 ./fonts/${_pkgbase}.woff "$pkgdir/usr/share/fonts/WOFF"
}

package_woff2-boxicons() {
  cd "${_pkgbase}-${commit}/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d "$pkgdir/usr/share/fonts/WOFF2"
  install -m644 ./fonts/${_pkgbase}.woff2 "$pkgdir/usr/share/fonts/WOFF2"
}
