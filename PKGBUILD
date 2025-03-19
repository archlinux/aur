pkgver=1.6.4
pkgrel=164
sha256sums=(
    41f35ca85965df8ab1396f4f0be87f7a4de360758f8e70a833afb105263f1621
    c621dce4fd45c2e911848fb03f7e4da7d0e31e03a08d7186b54e58e2a92593be
)
_pkgname=pixiv-multiplatform
pkgname=pixiv-multiplatform-bin
pkgdesc="基于Kotlin技术栈的全平台的第三方pixiv客户端"
url="https://pmf.kagg886.top"
license=(GPL3)
arch=(x86_64)
source=(
    "https://github.com/kagg886/Pixiv-MultiPlatform/releases/download/v$pkgver/linux.tar.gz"
    Pixiv-MultiPlatform.desktop
)

package(){
    install -d $pkgdir/opt/
    cp -r Pixiv-MultiPlatform $pkgdir/opt/
    install -Dm755 Pixiv-MultiPlatform.desktop $pkgdir/usr/share/applications/Pixiv-MultiPlatform.desktop
    install -Dm644 Pixiv-MultiPlatform/lib/Pixiv-MultiPlatform.png $pkgdir/usr/share/icons/hicolor/256x256/apps/Pixiv-MultiPlatform.png
}
