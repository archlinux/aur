# Maintainer: sjsanc <sjsanc@protonmail.com>
pkgname=nineveh-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal ebook library manager for Linux with Kindle device support"
arch=('x86_64')
url="https://github.com/sjsanc/nineveh"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
options=('!strip')

source=("nineveh-${pkgver}-linux-amd64.tar.gz::https://github.com/sjsanc/nineveh/releases/download/v${pkgver}/nineveh-${pkgver}-linux-amd64.tar.gz")
sha256sums=('PLACEHOLDER')

package() {
    install -Dm755 "${srcdir}/nineveh" "${pkgdir}/usr/bin/nineveh"
}
