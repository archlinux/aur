# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=6.0.0
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'openssl-1.1')
source=("https://publish.u-tools.cn/version2/utools_${pkgver}_amd64.deb")
sha512sums=('362ab3578ccd8dfde8347ed4cd1bbd399591334d68dea393e658eef68c152e9f91ce60f02992e62a559e3220d1aef341c31cfd1f6dc235e7dfbdbf3a8d1c082f')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
