pkgname=legacy-launcher-ely.by
pkgver=0.0.1
pkgrel=1
pkgdesc="Legacy launcher version from ely.by"
arch=('any')
url='https://llaun.ch/'
license=('GPL3')
depends=('jdk21-openjdk>=21')
source=("https://github.com/Pro7777tim/legacy-launcher-ely.by/blob/master/LegacyLauncher.jar"
        "legacy-launcher.desktop")
sha256sums=('SKIP'
            'SKIP')

#=========================================
package() {
   install -Dm644 "$srcdir/LegacyLauncher.jar" "$pkgdir/usr/lib/legacy-launcher/LegacyLauncher.jar"
   install -Dm644 "$srcdir/legacy-launcher.desktop" "$pkgdir/usr/share/applications/legacy-launcher.desktop"
}
