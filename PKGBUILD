# Maintainer: MaoYaotang <maoyaotang@163.com>
pkgname=apktool-toolbox
pkgver=1.3.6
pkgrel=1
pkgdesc="APK全能工具箱 - 解包/打包/签名/查壳/刷机包签名/ADB设备管理"
arch=('x86_64')
url="https://github.com/maoyaotang12/apktool-toolbox"
license=('GPL3')
depends=(
    qt6-base
    android-tools
    android-sdk-build-tools
    unzip
    java-runtime-common
    android-apktool-git
    android-signapk-git
)
makedepends=(
)
source=(git+$url.git)
sha256sums=('SKIP')

package() {
    install -Dm755 $srcdir/$pkgname/APKToolBox "$pkgdir/usr/bin/apktool-toolbox"

    install -Dm644 $srcdir/$pkgname/apktool-toolbox.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/apktool-toolbox.svg"
    install -Dm644 $srcdir/$pkgname/apktool-toolbox.desktop "$pkgdir/usr/share/applications/apktool-toolbox.desktop"
    install -D -m644 $srcdir/$pkgname/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
