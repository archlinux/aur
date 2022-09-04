# Maintainer: Matej Lach <me@matej-lach.me>

pkgname=tailwindcss-bin
pkgver=3.1.8
pkgrel=1
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=(x86_64)
url='https://tailwindcss.com'
license=('MIT')
conflicts=('tailwindcss')
provides=('tailwindcss')
source=("tailwindcss-linux-x64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")
sha256sums=('fb77a0ac5736a5559cf63dfbc094d6ad7857318815ae52d9a6e8e8602a4df337')

package() {
    install -d "${pkgdir}/usr/bin"

    cp -a "${srcdir}/tailwindcss-linux-x64" "${pkgdir}/usr/bin/tailwindcss"

    chmod +x "${pkgdir}/usr/bin/tailwindcss"
}
