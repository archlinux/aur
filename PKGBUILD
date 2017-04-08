# Maintainer: gato_lento <vukk.euob at gmail>
pkgname=combustion
pkgver=0.5.1
pkgrel=1
pkgdesc='Sleek, modern web interface for Transmission'
arch=('any')
url='https://github.com/Secretmapper/combustion'
license=('MIT')
depends=('transmission-cli')

source=(
  "https://github.com/Secretmapper/$pkgname/archive/release.zip"
  "LICENSE"
  "combustion.sh"
)

sha1sums=(
  3324c2a081d3a5c6ba3c192e5ef3e324910ad369
  ee69e0bf9099a1ff6d130cb4662b3f07fca11c1e
  1b2e73e143508792e94bd7d35f2e0d68b837527a
)

package() {
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m755 "$srcdir/combustion.sh" "$pkgdir/etc/profile.d/combustion.sh"
  cp -r "$srcdir/combustion-release" "$pkgdir/usr/share/$pkgname"
}
