# Maintainer: Matthias De Bie <mattydebie@gmail.com>

pkgname="invoiceninja-desktop"
pkgdesc="Desktop version for Invoice Ninja"
pkgver="5.0.60"
pkgrel=1
url="https://www.invoiceninja.com/desktop/"
source=("https://download.invoiceninja.com/linux" "invoiceninja-desktop.desktop")
arch=('i686' 'x86_64')
license=('unknown')
sha256sums=('c76660c5aa9fcfa3c4f329798656f91e14467214207b02f65e5439ecb722d652' 'b22d248305fd80fa230a27bd1674f8c817332c2910079c6e7cc0ccb42942a93a')

package() {
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -r bundle/data ${pkgdir}/opt/${pkgname}
  cp -r bundle/lib ${pkgdir}/opt/${pkgname}
  install -m 755 bundle/Invoice_Ninja ${pkgdir}/opt/${pkgname}/

  mkdir -p ${pkgdir}/usr/share/applications
  install -m 655 invoiceninja-desktop.desktop ${pkgdir}/usr/share/applications/
}
