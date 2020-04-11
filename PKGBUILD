# Maintainer: Jack Chen <redchenjs@live.com>
# Maintainer: Leihu Xi <leihuxi@gmail.com>

pkgname=mitalk
pkgver=4.0.98
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
    'c63f7873958484906e8ba3654ff9044a81cc992231a765c36664752aa56f0f3bae7141560397e5525e879d3c5d170af008948221bd09a224a066f0779bc315e7'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/MiTalk/mitalk "$pkgdir/usr/bin/mitalk"
}
