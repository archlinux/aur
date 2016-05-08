#Maintainer: hexchain <i at hexchain.org>
pkgname=hmcl
pkgver=2.4.1.50
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
sha256sums=('0300218f29af82e9b302a94b37a4c9a92aea26b960bfd1b2e16c0130ac61cfcf'
            'ea84b0259b815a0afe9f37a8b8d94e2b1110b744e21fabf6dd170a33b91407af'
            '2b1a94c2d5695a2803aa012121f45afb265aa2eae8228f143c4bbcdac62f079e')
