# Maintainer: taxin <unknownbrofrombd@duck.com>
pkgname=browsercode-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="An AI coding agent that drives real browsers (opencode fork, adds browser_execute via CDP) — prebuilt binary"
arch=('x86_64' 'aarch64')
url="https://github.com/browser-use/browsercode"
license=('MIT')
provides=('bcode' 'browsercode')
conflicts=('bcode' 'browsercode')
optdepends=('uv: required at runtime for the browser_execute tool')
options=('!debug' '!strip')

source_x86_64=("https://github.com/browser-use/browsercode/releases/download/v${pkgver}/bcode-linux-x64.tar.gz")
sha256sums_x86_64=('d1b25ae94ac7b6be54fd9ba100d3c8faa0b167f934252d9cf0be14fed604e3a7')

source_aarch64=("https://github.com/browser-use/browsercode/releases/download/v${pkgver}/bcode-linux-arm64.tar.gz")
sha256sums_aarch64=('8a2fce58c9b258a03cc3c3e899107445aa0357088a022dbb7fe9a342bb379f89')

package() {
  install -Dm755 "$srcdir/bcode" "$pkgdir/usr/bin/bcode"
}
