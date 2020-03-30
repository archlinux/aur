# Maintainer: Reily Siegel <mail@reilysiegel.com>
pkgname=whirlpool-gui-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Desktop GUI for Whirlpool by Samourai-Wallet."
arch=('x86_64')
url="https://github.com/Samourai-Wallet/whirlpool-gui/"
license=('custom:Unlicense')
depends=('dbus' 'glib2' 'hicolor-icon-theme' 'java-runtime' 'nss')
source=("https://github.com/Samourai-Wallet/whirlpool-gui/releases/download/${pkgver}/whirlpool-gui_${pkgver}_amd64.deb"
       LICENSE)
sha512sums=('c0a3960d113a440c3659e1c4ea6ab3cdb27a6566f24d60d3061b16eae7214a57bfddf6ef30b3f3d25ec03c357a510300f70213b54b248260d279f82881768802'
            '6db610810f1b22a21ef217b4b6ace78dd5a4f427be3e6934a5770b64d019c0699459ea433b7117e955aac3feea02bd703fba2892a7961e27b2c0de859f68d7d7')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Install LICENSE
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
