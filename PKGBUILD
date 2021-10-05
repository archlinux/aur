# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname="binocle"
pkgver="0.1.1"
pkgrel=2
pkgdesc="a graphical tool to visualize binary data"
arch=("x86_64")
url="https://github.com/sharkdp/binocle"
license=("Apache-2.0" "MIT")
source=("https://github.com/sharkdp/${pkgname}/releases/download/v${pkgver}/${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('e1e075675c8669272141bd7e0f6ffba61996754481ee5d0fcebeb29496d06c4e')

package() {
  mkdir -p "${pkgdir}/usr/local/bin"
  cd "${pkgname}-v${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "${pkgname}" "$pkgdir/usr/local/bin/${pkgname}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE-APACHE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 'LICENSE-MIT' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
