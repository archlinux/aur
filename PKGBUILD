# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="binocle"
pkgver="0.1.2"
pkgrel=1
pkgdesc="a graphical tool to visualize binary data"
arch=("x86_64")
url="https://github.com/sharkdp/binocle"
license=("Apache-2.0" "MIT")
source=("https://github.com/sharkdp/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('1d0c63d5d9f6e06e26261fbb53d3a6d2eef61c52cfaf362348168315d68b6e84')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  cd "${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "${pkgname}" "$pkgdir/usr/local/bin/${pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE-APACHE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 'LICENSE-MIT' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
