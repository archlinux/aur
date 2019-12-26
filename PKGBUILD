# Maintainer: Jack Chen <redchenjs@live.com>
# Maintainer: Leihu Xi <leihuxi@gmail.com>

pkgname=mitalk
pkgver=4.0.95
pkgrel=1
pkgdesc="MiTalk Messenger"
arch=('x86_64')
url="http://www.miliao.com/"
license=('custom')
depends=(
    'gtk3'
    'nss'
    'libxss'
)
source=(
    "https://s1.zb.mi.com/miliao/apk/miliao/8.8/MiTalk_$pkgver.deb"
)
sha512sums=(
    '0be935f980b681d02bb23cee59d69949f476e3d44f5ed2301c341b431ed60d8e8db4cd99e1959b385e2e9eb4707c6bc4c7dd41538b7d1f14ee7c0827a97f87d7'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/MiTalk/mitalk "$pkgdir/usr/bin/mitalk"
}
