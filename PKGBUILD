# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=6.1.0
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'openssl-1.1')
source=("https://publish.u-tools.cn/version2/utools_${pkgver}_amd64.deb")
sha512sums=('509c5abd5ddd96b13105069f04ffca7d4aee0fd04bfbfaa4be507830dd6dc732c2e3f94c4bc5379e36f8b58929220bda56a3448821503b4fd47315619e0ada77')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
