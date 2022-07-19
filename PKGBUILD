# Mantainer: nemesys <nemstar zoho com>

pkgname=lenovo-ice-mode
pkgver=1.0
pkgrel=3
pkgdesc='Set Lenovo Intelligent Cooling Engine via acpi_call. Laptops with this feature available in the bios can use lenovo-ice-mode to switch between Intelligent Cooling, Extreme Performance, and Battery Saving mode.'
arch=('any')
depends=(acpi_call)
source=(lenovo-ice-mode)
sha512sums=('6ae4173fc9a9f948d7522d0a4ddaf4991e9c79e685faaa9338bbb6ca5956a2fbea1389283f606b21d2be2b9b005d4b122b786667361161af54426ad127dd7e58')
package() {
    mkdir -p "${pkgdir}"/usr/local/bin
    install -Dm755 lenovo-ice-mode "${pkgdir}/usr/local/bin"
}

