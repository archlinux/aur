pkgname=rpmlauncher-bin
pkgver=1.0.6+895
pkgrel=1
pkgdesc="A better Minecraft Launcher that supports cross-platform and many functionalities for you to explore! "
license=('GPL3')
depends=()
makedepends=()
arch=('x86_64')
checkdepends=()
optdepends=()
provides=('rpmlauncher')
conflicts=('rpmlauncher-git' 'rpmlauncher')
replaces=()
backup=()
options=()
changelog=
source=("$pkgname-$pkgver.zip::https://github.com/RPMTW/RPMLauncher/releases/download/$pkgver/RPMLauncher-Linux.zip")
md5sums=('SKIP')
package(){
  mkdir -p $pkgdir/opt/RPMLauncher
  cp -rT $srcdir/RPMLauncher-Linux $pkgdir/opt/RPMLauncher
  mkdir -p $pkgdir/usr/share/applications/
  echo "[Desktop Entry]
Categories=Game;ArcadeGame;
Comment="A better Minecraft Launcher that supports cross-platform and many functionalities for you to explore! "
Encoding=UTF-8
Exec="/opt/RPMLauncher/RPMLauncher --origin archUserRepository"
Icon="/opt/RPMLauncher/data/flutter_assets/assets/images/Logo.png"
Name=RPMLauncher
Path=/opt/RPMLauncher
StartupNotify=false
Terminal=false
Type=Application
Version=$PKGVER" >> $pkgdir/usr/share/applications/RPMLauncher.desktop
}
