# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="binocle"
pkgver="0.2.0"
pkgrel=1
pkgdesc="a graphical tool to visualize binary data"
arch=("x86_64")
url="https://github.com/sharkdp/binocle"
license=("Apache-2.0" "MIT")
source=("https://github.com/sharkdp/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('3c0db1c5b3759ac68287ff4e27d5f1afe5c0fd1bfca00f33fa18527ed6e16060')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  cd "${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "${pkgname}" "$pkgdir/usr/local/bin/${pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE-APACHE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 'LICENSE-MIT' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
