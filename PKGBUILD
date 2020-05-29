pkgname=rossa-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Attempt to create a SimpleHTTPServer in Rust. Also inspired by gossa. "
arch=('any')
url="https://github.com/rednithin/rossa"
license=('MIT')
provides=('rossa')
conflicts=('rossa')

source=("https://github.com/rednithin/rossa/releases/download/v${pkgver}/${pkgname/-bin}.tar.gz")
sha256sums=('a8a36fd35506b86ae1dc3e90ed909c33c0d20afd929b129ac60a013ec064b228')

package() {
  install -Dm755 "${srcdir}/target/release/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}