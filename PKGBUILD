# Maintainer: syrf109475 <syrf109475@qq.com>
pkgname=flix-stable
pkgver=1.3.1
pkgrel=1
pkgdesc="像聊天一样传文件"
arch=('x86_64')
url="https://flix.center/"
license=('GPL')
depends=(cairo cairomm pango libkeybinder3 zlib libnotify atkmm libappindicator-gtk3 jtdx hicolor-icon-theme gtk3 glibc glib2 gdk-pixbuf2 desktop-file-utils)
source=("https://github.com/syrf109475/Flix-for-ArchLinux/releases/download/${pkgver}/flix-stable-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('SKIP')


package() {
    mkdir -p "$pkgdir"
    tar -xvf "${srcdir}/flix-stable-${pkgver}-1-x86_64.pkg.tar.zst" -C "$pkgdir" && cd "$pkgdir" && rm ./.*
}
