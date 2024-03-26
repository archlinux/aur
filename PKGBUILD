# Maintainer: irmluity <45vw4yz8g@mozmail.com>

pkgname=marble-shell-theme
pkgver=46.1
pkgrel=1
pkgdesc='Shell theme for GNOME DE'
url='https://github.com/imarkoff/Marble-shell-theme'
arch=('any')
license=('GPL3')
    source=("https://github.com/imarkoff/Marble-shell-theme/releases/download/${pkgver//_/-}/Marble-shell.tar.gz"
sha256sums=('f45aef22cb0f7e09055036f63a9c9d46d56c23d733ab67ee66e2ab773b5978a6')
    "b7e67a075c4cfdffbcf3925554e7e5af56a6e62ef0b044b3bf959a465b06b541"
package() {
    rm readme.txt Marble-shell.tar.xz
    install -dm755 "${pkgdir}/usr/share/themes"
    cp -r . "$pkgdir/usr/share/themes/"
    find ${pkgdir} -type f -exec chmod 644 {} \;
    find ${pkgdir} -type d -exec chmod 755 {} \;
}
