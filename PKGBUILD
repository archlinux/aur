# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=utools
pkgver=5.1.0
pkgrel=1
pkgdesc="uTools Utilities"
arch=('x86_64')
url="https://u.tools/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'openssl-1.1')
source=("https://publish.u-tools.cn/version2/utools_${pkgver}_amd64.deb")
sha512sums=('7593de81e37a996aa36c4599d264098d49a9e01f8ab9d05794ec469f0cd7ab067b2a0681e8bc9c8cdeca09d0515f3332672e0a4847cfb0549430a1da43795363')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/uTools/utools "$pkgdir/usr/bin/utools"
}
