# Maintainer: Scott-Nx <158021536 plus Scott-Nx at users dot noreply dot github dot com>

pkgname=quantumlauncher-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="A simple, powerful Minecraft launcher"
arch=('x86_64')
url="https://github.com/Mrmayman/quantumlauncher"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=('quantumlauncher')
source=("${pkgname}-${pkgver}.zip::https://github.com/Mrmayman/quantumlauncher/releases/download/v${pkgver}/quantum_launcher_linux_x86_64.zip")
sha256sums=('7ca878491e120b711e27d783110684ebdb4656ebb383b5d8c7520ae339110e42')

package() {
    install -Dm755 "${srcdir}/quantum_launcher" "${pkgdir}/usr/bin/quantumlauncher"
}
