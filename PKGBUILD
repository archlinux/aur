# Maintainer: Solomon Fosuhene <your@email.com>
pkgname=sololinux-fastfetch
pkgver=1.0
pkgrel=1
pkgdesc="SoloLinux Fastfetch configuration (ascii.txt + config.jsonc)"
arch=('any')
url="https://github.com/yourusername/fastfetch-config-solomon"
license=('MIT')
depends=('fastfetch')
# source=('ascii.txt' 'config.jsonc')
source=('ascii.txt' 'config.jsonc' 'LICENSE')
sha256sums=('SKIP' 'SKIP' '4174fd457ccfb6bb949eeefadef6b0cc6e62b2f2f7109950ea52aff6d722d8f1')

package() {
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "${pkgdir}/etc/skel/.config/fastfetch"
  install -Dm644 "${srcdir}/ascii.txt" "${pkgdir}/etc/skel/.config/fastfetch/ascii.txt"
  install -Dm644 "${srcdir}/config.jsonc" "${pkgdir}/etc/skel/.config/fastfetch/config.jsonc"
}

