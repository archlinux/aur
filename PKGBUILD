# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=5.2.0
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'openssl-1.1')
source=("https://publish.u-tools.cn/version2/utools_${pkgver}_amd64.deb")
sha512sums=('0c53cf056df6e3d91392dab6685c97f8a478ac2199069f93349cf1930f6d1c9ae8df85d9fa895e5ceb5e1ff4f70c2e63ee93b0c6fcf590da2733e0b300c0e95e')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
