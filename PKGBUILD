pkgname=plasma-applet-commandoutput
pkgver=12
pkgrel=1
pkgdesc="Run command every second and displays the output."
arch=('any')
url="https://github.com/Zren/plasma-applet-commandoutput"
license=('GPL-2.0')
source=("https://github.com/Zren/plasma-applet-commandoutput/archive/v$pkgver.tar.gz")
md5sums=('08a8dbbcc9529c75183630a920869bc1')
depends=('plasma-workspace')

package() {
    cd "$srcdir/plasma-applet-commandoutput-$pkgver"
    mkdir -p $pkgdir/usr/share/plasma/plasmoids/com.github.zren.commandoutput
    cp -r package/* $pkgdir/usr/share/plasma/plasmoids/com.github.zren.commandoutput
}
