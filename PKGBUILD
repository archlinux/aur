# Maintainer: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=any-proxy-git
pkgver=1.2
pkgrel=3
pkgdesc="A transparent proxy written in Golang"
url="https://github.com/ryanchapman/go-any-proxy.git"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/ryanchapman/go-any-proxy")
md5sums=('SKIP')

build() {
  cd "$srcdir/go-any-proxy"

  ./make.bash
}

package() {
  cd "$srcdir/go-any-proxy"

  #Install binaries
  install -Dm755 any_proxy "$pkgdir/usr/bin/anyproxy"
}
