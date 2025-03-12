pkgver=1.6.4
pkgrel=164
sha256sums=(
    0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5
    c621dce4fd45c2e911848fb03f7e4da7d0e31e03a08d7186b54e58e2a92593be
)
_pkgname=pixiv-multiplatform
pkgname=pixiv-multiplatform-bin
pkgdesc="基于Kotlin技术栈的全平台的第三方pixiv客户端"
url="https://pmf.kagg886.top"
license=(GPL3)
arch=(x86_64)
source=(
    "https://github.com/kagg886/Pixiv-MultiPlatform/releases/download/$pkgver/linux.tar.gz"
    Pixiv-MultiPlatform.desktop
)

package(){
    install -d $pkgdir/opt/Pixiv-MultiPlatform/
    cp -ar composeApp/build/compose/binaries/main-release/app/Pixiv-MultiPlatform $pkgdir/opt/
    install -Dm755 ../Pixiv-MultiPlatform.desktop $pkgdir/usr/share/applications/Pixiv-MultiPlatform.desktop
    install -Dm644 composeApp/build/compose/binaries/main-release/app/Pixiv-MultiPlatform/lib/Pixiv-MultiPlatform.png $pkgdir/usr/share/icons/hicolor/256x256/apps/Pixiv-MultiPlatform.png
}
