# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=vr-lighthouse-bin
_pkgname=lighthouse
pkgver=1.1.1
pkgrel=1
pkgdesc="VR Lighthouse power state management in Rust"
arch=('x86_64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
source=("${url}/releases/download/${pkgver}/Linux-x86_64.zip")
sha512sums=("42fad14b86b6f081daf1d910e219d94cfadb4d36cef0a46a5b4d602745a36be4b68b55655c805fae7f573a3448c3cabf9a10281127674f71502cbd746f4da49a")

package() {
  install -Dm755 lighthouse "${pkgdir}/usr/bin/${_pkgname}"
}

