pkgname=whatsie
pkgver=2.0.18
pkgrel=
pkgdesc="A simple & beautiful desktop client for WhatsApp Web."
arch=('x86_64')
url="https://whatsie.chat/"
license=('MIT')
depends=('desktop-file-utils' 'gconf' 'gtk2' 'gvfs' 'hicolor-icon-theme' 'libgudev' 'libgcrypt' 'libnotify' 'libxtst' 'nss' 'python' 'xdg-utils' 'libcap' )
optdepends=('hunspell: spell check' )
options=('!docs' '!emptydirs')
install=$pkgname.install
source=("https://dl.bintray.com/aluxian/aur/dist/whatsie-2.0.18-linux-amd64.deb")
validpgpkeys=('6DDA23616E3FE905FFDA152AE61DA9241537994D')
md5sums=('517c65c9c2c1f3ebda8f1fe8d12345b7')
package() {
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  # Link to the binary
  ln -s /opt/whatsie/whatsie "$pkgdir/usr/bin/whatsie"
}
