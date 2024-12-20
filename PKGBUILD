# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=6.0.1
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'openssl-1.1')
source=("https://publish.u-tools.cn/version2/utools_${pkgver}_amd64.deb")
sha512sums=('4d60189cba93d619885602362e39d8940b68a9a2c1edd3039985168a19412883a50b44e742952049b010ea38bc2c4ae1e1d22403510ff132942c0b7b2850165a')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
