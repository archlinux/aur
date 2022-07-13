# Mantainer: nemesys <nemstar zoho com>

pkgname=lenovo-ice-mode
pkgver=1.0
pkgrel=2
pkgdesc="Easily set Lenovo Intelligent Cooling Engine with acpi_call using the $pkgname bash script."
arch=('any')
depends=(acpi_call)
source=(lenovo-ice-mode)
sha512sums=('a27fd6a80fed4359211b7cb4d8b4b5e1e1e22ce8ff80599ed8f0ec5d8b03750ff54a3c4c0f6a03ce39fde4588470edf3ac92086b1ee4fecdf8b3ec4bd15eabc4')
package() {
    mkdir -p "${pkgdir}"/usr/local/bin
    install -Dm755 lenovo-ice-mode "${pkgdir}/usr/local/bin"
}

