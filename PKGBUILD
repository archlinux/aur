# Maintainer: Jack Chen <redchenjs@live.com>
# Maintainer: Leihu Xi <leihuxi@gmail.com>

pkgname=mitalk
pkgver=4.0.100
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
    '88cc6fb7e2585069a1bd506efdba4812dacd04d9f1988fff2d47feffe2b0fa5ba85c58ba3a39ce24a7093ce887ae6a726f89c6cb76ff775a6389bf26f6a00800'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/MiTalk/mitalk "$pkgdir/usr/bin/mitalk"
}
