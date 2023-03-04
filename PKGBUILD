# Maintainer: Swarnaditya Singh (DemonKingSwarn) <demonkingswarn@protonmail.com>
pkgname=whatsapp-linux
pkgver=6.3.r.
pkgrel=1
pkgdesc="WhatsaApp Client for Linux."
arch=(x86_64)
url="https://gitlab.com/DemonKingSwarn/whatsapp-linux"
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(whatsapp)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  printf "6.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  sudo curl -sL "https://aur.archlinux.org/cgit/aur.git/plain/whatsapp-linux.desktop?h=whatsapp-linux" -o /usr/share/applications/whatsapp-linux.desktop
  cd "${pkgname}"
  sudo mkdir -p /opt/WhatsApp-linux-x64
  sudo cp -rf * /opt/WhatsApp-linux-x64
}
