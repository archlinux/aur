pkgname=alter-bin
pkgver=0.3.0
pkgrel=1
pkgdesc=" Switch git username and email and credential in one-line."
arch=('x86_64')
url="https://github.com/AmaseCocoa/alter"
license=('MIT')
provides=("${pkgname%-bin}=$pkgver")
conflicts=("${pkgname%-bin}")

sha256sums_x86_64=('557d9f8d5580a3f157ddbee035ceadd0de1ed9f47e52a4513548ab46d18c2514')
source_x86_64=("https://github.com/AmaseCocoa/alter/releases/download/v${pkgver}/alter-linux-x86_64")

package() {
  install -Dm755 "${srcdir}/alter-linux-x86_64" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
