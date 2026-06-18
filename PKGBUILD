# Maintainer: sjsanc <sjsanc@protonmail.com>
pkgname=nineveh-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Minimal ebook library manager for Linux with Kindle device support"
arch=('x86_64')
url="https://github.com/sjsanc/nineveh"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
options=('!strip')

source=("nineveh-${pkgver}-linux-amd64.tar.gz::https://github.com/sjsanc/nineveh/releases/download/v${pkgver}/nineveh-${pkgver}-linux-amd64.tar.gz")
sha256sums=('b64ca2eee4180e53e99cff4f0aebccbc7b29cb10be2e4938ed6de1778488d6f5')

package() {
    install -Dm755 "${srcdir}/nineveh" "${pkgdir}/usr/bin/nineveh"
}
