pkgname=whatsie
pkgver=2.0.14
pkgrel=1
epoch=
pkgdesc="A simple & beautiful desktop client for WhatsApp Web."
arch=('x86_64')
url="https://github.com/Aluxian/Whatsie"
license=('MIT')
depends=('desktop-file-utils' 'gconf' 'gtk2' 'gvfs' 'hicolor-icon-theme' 'libgudev' 'libgcrypt' 'libnotify' 'libxtst' 'nss' 'python' 'xdg-utils' 'libcap')
optdepends=('hunspell: spell check')
options=('!docs' '!emptydirs')
install=.install
source=("whatsie-2.0.14-linux-amd64.deb::https://github.com/Aluxian/Whatsie/releases/download/v2.0.14/whatsie-2.0.14-linux-amd64.deb")
md5sums=('a7e1cb4c020c98aa74cc75e1cac22014')
package() {
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf data.tar.gz -C "/"

  msg2 "Fixing permissions of documentation folder..."
  chmod -R 755 ""/opt/
  chmod -R 755 ""/etc/
  chmod -R 755 ""/usr/
}
