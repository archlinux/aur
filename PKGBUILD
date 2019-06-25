# Maintainer: Reily Siegel <mail@reilysiegel.com>
pkgname=whirlpool-gui-bin
pkgver=0.6.4
pkgrel=2
pkgdesc="Desktop GUI for Whirlpool by Samourai-Wallet."
arch=('x86_64')
url="https://github.com/Samourai-Wallet/whirlpool-gui/"
license=('custom:Unlicense')
depends=('dbus' 'glib2' 'hicolor-icon-theme' 'java-runtime' 'nss')
source=("https://github.com/Samourai-Wallet/whirlpool-gui/releases/download/0.6.4/whirlpool-gui_${pkgver}_amd64.deb"
       LICENSE)
sha512sums=('acb3003613dfd5478026d15a24745b41308f3fe1911ea07021ef232c2fc774858f7b336909deb71732dee16972745929a448368be8f2da7952f3dbd01266b82b'
            '6db610810f1b22a21ef217b4b6ace78dd5a4f427be3e6934a5770b64d019c0699459ea433b7117e955aac3feea02bd703fba2892a7961e27b2c0de859f68d7d7')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Install LICENSE
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
