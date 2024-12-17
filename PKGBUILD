# Maintainer: Stephen Power <simpilldev@gmail.com>

pkgname=tailwindcss-extra-bin
pkgver=1.7.21
pkgrel=4
pkgdesc='Standalone Tailwind CLI without Node.js dependency. Bundled with DaisyUI.'
arch=(x86_64)
url='https://tailwindcss.com'
license=('MIT')
options=(!strip)
conflicts=('tailwindcss')
provides=('tailwindcss')
source=("https://github.com/dobicinaitis/tailwind-cli-extra/releases/download/v${pkgver}/tailwindcss-extra-linux-x64")
sha256sums=('c550f519e53f77cbe34a221b9b893c4810a5072cd2f31d830f2e395769ad4cf6')

package() {
    install -d "${pkgdir}/usr/bin"
    mv "${srcdir}/tailwindcss-extra-linux-x64" "${srcdir}/tailwindcss-extra"
    install -m 755 tailwindcss-extra "${pkgdir}/usr/bin/"
    chmod +x "${pkgdir}/usr/bin/tailwindcss-extra"
}

