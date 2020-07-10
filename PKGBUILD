# Maintainer: Jack Chen <redchenjs@live.com>
# Maintainer: Leihu Xi <leihuxi@gmail.com>

pkgname=mitalk
pkgver=4.0.99
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
    'ce2a3ca21fece2796e960e75e739d6c47f4eac1bed996690070a375a6391b84a633054aaad9811c76b5175c711b57846e48fd1a6260b6576f8a88d3071cdf67e'
)

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/MiTalk/mitalk "$pkgdir/usr/bin/mitalk"
}
