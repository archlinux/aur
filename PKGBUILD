pkgname=passmango-bin
pkgver=1.1
pkgrel=1
pkgdesc="A offline CLI password manager with high levels of encryption"
arch=('x86_64' 'aarch64')
url="https://github.com/kebabcode1/PassmanGO"
license=('MIT')
depends=('xclip') 
provides=('passmango')
conflicts=('passmango')
# This points exactly to your GitHub Release link
source=("https://github.com/kebabcode1/PassmanGO/releases/download/v1.1/PassmanGO")
sha256sums=('SKIP')
package() {
    install -Dm755 "${srcdir}/PassmanGO" "${pkgdir}/usr/bin/passmango"
}

