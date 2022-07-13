# Mantainer: nemesys <nemstar zoho com>

pkgname=lenovo-ice-mode
pkgver=1.0
pkgrel=1
pkgdesc="Easily set Lenovo Intelligent Cooling Engine with acpi_call using the $pkgname bash script."
arch=('any')
depends=(acpi_call)
source=(lenovo-ice-mode)
sha512sums=('eece9cc8ef57d6f11b250e2c8454565c65f6c4026baa75509fcc670c31b99faa2028f3056f275ead17050a24e3e16ae6513d0a8a3584a94343a7c892744fcfa7')
package() {
    mkdir -p "${pkgdir}"/usr/local/bin
    install -Dm755 lenovo-ice-mode "${pkgdir}/usr/local/bin"
}

