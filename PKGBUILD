pkgname=rpmlauncher-bin
pkgver=1.0.0.683
pkgrel=1
pkgdesc="A multi-functional Minecraft Launcher power by the RPMTW Team, made with Flutter and Dart"
license=('GPL')
depends=()
makedepends=()
arch=('x86_64')
checkdepends=()
optdepends=()
provides=()
conflicts=(rpmlauncher-git)
replaces=()
backup=()
options=()
changelog=
source=("https://github.com/RPMTW/RPMLauncher/releases/download/1.0.0.683/RPMLauncher-Linux.AppImage"
        "https://raw.githubusercontent.com/RPMTW/RPMLauncher/master/images/Logo.png")
noextract=("RPMLauncher-Linux.AppImage"
           "Logo.png")
md5sums=('SKIP'
         'SKIP')
package(){
  install -Dm755 "${srcdir}"/"RPMLauncher-Linux.AppImage" "${pkgdir}"/opt/RPMLauncher/rpmlauncher
  install -Dm755 "${srcdir}"/"Logo.png" "${pkgdir}"/opt/RPMLauncher/Logo.png
  echo "[Desktop Entry]
Categories=Game;ArcadeGame;
Comment=Edit
Encoding=UTF-8
Exec="/opt/RPMLauncher/Logo.png"
Icon="/opt/RPMLauncher/data/flutter_assets/images/Logo.png"
Name=RPMLauncher
Path=/opt/RPMLauncher
StartupNotify=false
Terminal=true
Type=Application
Version=$PKGVER" >> "${srcdir}"/RPMLauncher.desktop
  install -Dm755 "${srcdir}"/RPMLauncher.desktop "${pkgdir}"/usr/share/applications/RPMlauncher.desktop
}
