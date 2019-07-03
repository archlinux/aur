# Maintainer: Reily Siegel <mail@reilysiegel.com>
pkgname=whirlpool-gui-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Desktop GUI for Whirlpool by Samourai-Wallet."
arch=('x86_64')
url="https://github.com/Samourai-Wallet/whirlpool-gui/"
license=('custom:Unlicense')
depends=('dbus' 'glib2' 'hicolor-icon-theme' 'java-runtime' 'nss')
source=("https://github.com/Samourai-Wallet/whirlpool-gui/releases/download/${pkgver}/whirlpool-gui_${pkgver}_amd64.deb"
       LICENSE)
sha512sums=('9af8cdbad7b49563b95a54a3ccdbadef1ff27fbf6a48a16639f5bc5381d8db7dee1d52937f7f9c015aca56b5e619432fc22e94cd11812980a11e5c18ea17f399'
            '6db610810f1b22a21ef217b4b6ace78dd5a4f427be3e6934a5770b64d019c0699459ea433b7117e955aac3feea02bd703fba2892a7961e27b2c0de859f68d7d7')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Install LICENSE
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
