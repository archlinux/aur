pkgver=1.8.2
pkgrel=1
sha256sums=(
	b9ac4c30b48b1c82af8c4ef76166aa7e9befc0cde53f0c2f03209ec7b82cbcb7
    c621dce4fd45c2e911848fb03f7e4da7d0e31e03a08d7186b54e58e2a92593be
)
_pkgname=pixiv-multiplatform
pkgname=pixiv-multiplatform-bin
pkgdesc="基于Kotlin技术栈的全平台的第三方pixiv客户端"
url="https://pmf.kagg886.top"
license=(GPL3)
arch=(x86_64)
source=(
    "https://github.com/magic-cucumber/Pixiv-MultiPlatform/releases/download/v$pkgver/linux.tar.gz"
    Pixiv-MultiPlatform.desktop
)

package(){
    install -d $pkgdir/opt/
    cp -r Pixiv-MultiPlatform $pkgdir/opt/
    install -Dm755 Pixiv-MultiPlatform.desktop $pkgdir/usr/share/applications/Pixiv-MultiPlatform.desktop
    install -Dm644 Pixiv-MultiPlatform/lib/Pixiv-MultiPlatform.png $pkgdir/usr/share/icons/hicolor/256x256/apps/Pixiv-MultiPlatform.png
}
