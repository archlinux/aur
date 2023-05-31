# Maintainer: Nonie689 <nonie689 at eclipso dot ch>
pkgname=go-dispatch-proxy-git
_pkgname=go-dispatch-proxy
pkgver=6.0.0
pkgrel=1
pkgdesc="A SOCKS5 load balancing proxy to combine multiple internet connections into one"
arch=('i686' 'x86_64')
url="https://github.com/extremecoders-re/go-dispatch-proxy"
license=('MIT')
depends=("go")
install=
source=("git+https://github.com/extremecoders-re/go-dispatch-proxy.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"

  go build
}

package() {

  install -Dm755 "$srcdir"/$_pkgname/go-dispatch-proxy -t "$pkgdir"/usr/bin/
}
