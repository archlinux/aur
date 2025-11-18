# Maintainer: meowcat <meowcat@meowcat.site>

pkgname=mct
pkgver=1.2
pkgrel=1
pkgdesc="A lightweight and simple text editor"
arch=('any')
url="https://git.meowcat.site/meowcat/meowcats-text-editor"
license=('custom')
depends=('java-runtime' 'libxi' 'libxrender' 'libxrandr' 'libxtst' 'libxinerama')
source=(
    "mct.jar::https://files.meowcat.site/aur-files/mct1.5/mct.jar"
    "mct"  # launcher script
)
sha256sums=('SKIP' 'SKIP')

package() {
    # Install JAR (renamed to mct.jar)
    install -Dm644 "$srcdir/mct.jar" \
        "$pkgdir/usr/share/java/mct/mct.jar"

    # Install launcher script
    install -Dm755 "$srcdir/mct" "$pkgdir/usr/bin/mct"
}
