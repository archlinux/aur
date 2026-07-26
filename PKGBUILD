# Maintainer: Bryan Joshua Pedini <bryan [at] pedini [dot] dev>

pkgname="tsparams"
pkgver="1.0.0"
pkgrel="2"
pkgdesc="A simple tool to extract and display Tailscale parameters"
url="https://git.bjphoster.com/source/${pkgname}"
arch=("any")
license=("GPL3")
depends=("python" "tailscale")
source=("https://git.bjphoster.com/source/${pkgname}/archive/${pkgver}.tar.gz")

sha256sums=("2cbf10ffca2f0adf21daff04bfb1cde401b2f9e713863a23b01aa6bddf1ff62d")

package() {
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}/tsparams.py" "${pkgdir}/usr/bin/${pkgname}"
}
