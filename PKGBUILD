# Maintainer: Jack Chen <redchenjs@live.com>
# Maintainer: Leihu Xi <leihuxi@gmail.com>

pkgname=mitalk
pkgver=4.0.91
pkgrel=2
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
    '2de3919d555cfdcd653e9ef4d54ec6ac5c484f2f4149b656f58e17168911ccd61f6d7098f20c8b3e71eecc619b518f855331c5cabf2310cafb77ddb4a3e0d84c'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/MiTalk/mitalk "$pkgdir/usr/bin/mitalk"
}
