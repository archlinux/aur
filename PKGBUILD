# Maintainer: Furkan Baytekin (Elagoht) <furkanbaytekin@gmail.com>
pkgname=pomodoit-bin
pkgver=1.0
pkgrel=2
pkgdesc="Track your todos with pomodoro clock"
arch=("x86_64")
url="https://github.com/Elagoht/PomoDoIt"
license=("GPL")
depends=("gtk3" "webkit2gtk")
provides=("pomodoit")
source=("https://github.com/Elagoht/PomoDoIt/releases/download/v${pkgver}/pomodoit.tar.gz")
sha256sums=("84be84fc410551d4e061896a2f70e4ff205b71fbe2b532d011f37a90514be8a0")

package() {
  install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share/icons
	install -d $pkgdir/usr/share/applications
  install -D $srcdir/usr/bin/pomodoit -t $pkgdir/usr/bin/
  install -D $srcdir/usr/share/applications/pomodoit.desktop -t $pkgdir/usr/share/applications/
  install -D $srcdir/usr/share/icons/hicolor/32x32/apps/pomodoit.png \
    -t $pkgdir/usr/share/icons/hicolor/32x32/apps/
  install -D $srcdir/usr/share/icons/hicolor/128x128/apps/pomodoit.png \
    -t $pkgdir/usr/share/icons/hicolor/128x128/apps/
  install -D $srcdir/usr/share/icons/hicolor/256x256@2/apps/pomodoit.png \
    -t $pkgdir/usr/share/icons/hicolor/256x256@2/apps//
}