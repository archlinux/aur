pkgname=whatsie
pkgver=2.0.15
pkgrel=1
pkgdesc="A simple & beautiful desktop client for WhatsApp Web."
arch=('x86_64')
url="https://github.com/Aluxian/Whatsie"
license=('MIT')
depends=('desktop-file-utils' 'gconf' 'gtk2' 'gvfs' 'hicolor-icon-theme' 'libgudev' 'libgcrypt' 'libnotify' 'libxtst' 'nss' 'python' 'xdg-utils' 'libcap')
optdepends=('hunspell: spell check')
options=('!docs' '!emptydirs')
install=whatsie.install
source=("whatsie-$pkgver-linux-amd64.deb::https://github.com/Aluxian/Whatsie/releases/download/v$pkgver/whatsie-$pkgver-linux-amd64.deb")
md5sums=('caeedca3cc47ab414923c1ffa9ec9fca')
package() {
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf data.tar.gz -C "$pkgdir/"

  # msg2 "Fixing permissions of documentation folder..."
  # chmod -R 775 "$pkgdir/opt/"
  # chmod -R 775 "$pkgdir/etc/"
  # chmod -R 775 "$pkgdir/usr/"
}
