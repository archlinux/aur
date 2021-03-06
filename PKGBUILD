# Maintainer: David Parrish <daveparrish@tutanota.com>
pkgname=whirlpool-gui-bin
pkgver=0.10.3
pkgrel=1
pkgdesc="Desktop GUI for Whirlpool by Samourai-Wallet."
arch=('x86_64')
url="https://code.samourai.io/whirlpool/whirlpool-gui"
license=('custom:Unlicense')
depends=('dbus' 'glib2' 'hicolor-icon-theme' 'java-runtime' 'nss')
source=("whirlpool-gui-$pkgver.deb::https://code.samourai.io/whirlpool/whirlpool-gui/uploads/fda2da816431c25598f532486ac0da09/whirlpool-gui_${pkgver}_amd64.deb"
        LICENSE)
sha512sums=('d58c738d533702a5f1c3ebb6bce6baa3f691f02f66351f5d7aad740da66e27a2522aca5eac89307715bc19cec74be0dbbd79187d5dd4e47911778ccc394186b4'
            '6db610810f1b22a21ef217b4b6ace78dd5a4f427be3e6934a5770b64d019c0699459ea433b7117e955aac3feea02bd703fba2892a7961e27b2c0de859f68d7d7')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Install LICENSE
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
