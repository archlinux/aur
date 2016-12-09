# Maintainer: Romain Bazile <gromain.baz@gmail.com>

pkgname=kinetis-design-studio
pkgver=3.2.0
pkgrel=1
epoch=
pkgdesc="IDE for the Kinetis microcontrollers range from NXP. Based on Eclipse. From RPM package distributed by NXP."
arch=('x86_64')
url="http://www.nxp.com/KDS"
license=('custom:"NXP"')
depends=('glibc' 'libusb-compat' 'libxt' 'nss' 'java-environment' 'libxslt' 'gconf' 'gtk2' 'alsa-lib' 'libxtst')
source=("https://freescaleesd.flexnetoperations.com/337170/727/9802727/$pkgname-$pkgver-$pkgrel.$arch.rpm" "LICENSE")
sha1sums=('188e9bfa9fb73de16f1f173a2279f59c8ceaabd4'
          '0d067fc6e11d07896e8aba9a94f5fc600bcd1e4e')
options=('!strip')

package() {
        cp -r ${srcdir}/usr ${pkgdir}/;
        cp -r ${srcdir}/opt ${pkgdir}/;
        cp -r ${srcdir}/lib ${pkgdir}/usr/;
        install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
