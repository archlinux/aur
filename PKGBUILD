# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=5.1.1
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'openssl-1.1')
source=("https://publish.u-tools.cn/version2/utools_${pkgver}_amd64.deb")
sha512sums=('b08d27f57b0a9d25bd657471cf1dbaddbab6d935398f83442f77fa6fd4ae620376830bb9700de8fde9087539a3c935e5b89969b68f4d48a5d6125a60b6707a4e')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
