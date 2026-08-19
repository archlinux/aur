# Maintainer: Lumina <luminanao at duck.com>
pkgname=xscp
pkgver=2
pkgrel=1
pkgdesc="Interactive scp wrapper with transfer history, fuzzy matching, and TUI file browsing"
arch=(x86_64)
url="https://codeberg.org/LuminaNAO/xscp"
license=(AGPL3)
depends=(bash fzf nnn openssh sshfs)
source=(git+https://codeberg.org/LuminaNAO/xscp.git#tag="v${pkgver}")
sha256sums=(SKIP)

package() {
    install -Dm755 xscp "${pkgdir}/usr/bin/xscp"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
