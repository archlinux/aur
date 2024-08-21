# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=5.2.1
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'openssl-1.1')
source=("https://publish.u-tools.cn/version2/utools_${pkgver}_amd64.deb")
sha512sums=('d4534b26d3de4f3310634a17ddfd208068f395fcda1a5f0c0a03dc22fbe6acdddf9f09ea391997fa8c0985e34a982ca3be64339ee965acbee1e81b9c76819335')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
