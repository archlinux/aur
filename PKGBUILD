# Maintainer: David Parrish <daveparrish@tutanota.com>
pkgname=whirlpool-gui-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="Desktop GUI for Whirlpool by Samourai-Wallet."
arch=('x86_64')
url="https://github.com/Samourai-Wallet/whirlpool-gui/"
license=('custom:Unlicense')
depends=('dbus' 'glib2' 'hicolor-icon-theme' 'java-runtime' 'nss')
source=("whirlpool-gui-$pkgver.deb::https://code.samourai.io/whirlpool/whirlpool-gui/uploads/89c3ec67c2fedd83aa604a5cf14cce41/whirlpool-gui_${pkgver}_amd64.deb"
        LICENSE)
sha512sums=('c3828d7c7fa9a2a19cf1a12318ee9e6ff16400b297172d9728030e51c0dce9e0837c2e554e47197dc3feb3c4e82ea751021e904c5dc0855da9047528701d6279'
            '6db610810f1b22a21ef217b4b6ace78dd5a4f427be3e6934a5770b64d019c0699459ea433b7117e955aac3feea02bd703fba2892a7961e27b2c0de859f68d7d7')

package(){
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # Install LICENSE
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
