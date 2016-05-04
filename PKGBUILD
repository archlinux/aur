#Maintainer: hexchain <i at hexchain.org>
pkgname=hmcl
pkgver=2.4.1.48
pkgrel=1
pkgdesc="Hello Minecraft! Launcher, a powerful Minecraft launcher."
arch=(any)
license=('GPL3')
url="https://github.com/huanghongxun/HMCL"
depends=('java-runtime' 'xorg-server-utils' 'openal')
noextract=("HMCL-$pkgver.jar")
source=(
    'hmcl'
    'hmcl.desktop'
    "$url/releases/download/${pkgver##*.}/HMCL-$pkgver.jar")

package() {
    cd "$srcdir"
    install -D -m755 "${srcdir}/hmcl" "${pkgdir}/usr/bin/hmcl"
    install -D -m644 "${srcdir}/HMCL-$pkgver.jar" "${pkgdir}/usr/share/hmcl/HMCL.jar"
    install -D -m644 "${srcdir}/hmcl.desktop" "${pkgdir}/usr/share/applications/hmcl.desktop"
}
sha256sums=('df5b4b8e70eb3b9938754a1e0466009c7b54182f674da5657496248ab985a7c9'
            'ea84b0259b815a0afe9f37a8b8d94e2b1110b744e21fabf6dd170a33b91407af'
            '90b92c77b4cb962a9f13dc673b10796648b6c1af13d06fc09698e26854e343e8')
