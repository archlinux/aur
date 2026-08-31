# Maintainer: sjsanc <sjsanc@protonmail.com>
pkgname=nineveh-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Minimal ebook library manager for Linux with Kindle device support"
arch=('x86_64')
url="https://github.com/sjsanc/nineveh"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
optdepends=('calibre: enables ebook format conversion via ebook-convert')
options=('!strip')

source=("nineveh-${pkgver}-linux-amd64.tar.gz::https://github.com/sjsanc/nineveh/releases/download/v${pkgver}/nineveh-${pkgver}-linux-amd64.tar.gz")
sha256sums=('ea5ba350dfe3370b667d0c9efa5ef5d02f0b6b16d6cc2ee0acacfc3aa762d9e1')

package() {
    install -Dm755 "${srcdir}/nineveh" "${pkgdir}/usr/bin/nineveh"
}
