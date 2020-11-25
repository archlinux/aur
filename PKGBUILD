# Maintainer: Jack Chen <redchenjs@live.com>
# Maintainer: Leihu Xi <leihuxi@gmail.com>

pkgname=mitalk
pkgver=4.0.101
pkgrel=1
pkgdesc="MiTalk Messenger"
arch=('x86_64')
url="http://www.miliao.com"
license=('custom')
depends=('gtk3' 'nss' 'libxss')
source=("https://s1.zb.mi.com/miliao/apk/miliao/8.8/MiTalk_$pkgver.deb")
sha512sums=('0d9de4af916e42ab064e19ee04bf7f7986d3f52a2aa64f31a8dee2604cfbd7cee975962ac54903d2ff06c1efe0007e2bf2a41bb28412e7675bb87dbf380fce32')

package() {
  tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/MiTalk/mitalk "$pkgdir/usr/bin/mitalk"
}
