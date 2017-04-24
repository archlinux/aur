# Maintainer: Julian Xhokaxhiu <info@julianxhokaxhiu.com>
pkgname=any-proxy-git
pkgver=1.2
pkgrel=2
pkgdesc="A transparent proxy written in Golang"
url="https://github.com/julianxhokaxhiu/go-any-proxy"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/julianxhokaxhiu/go-any-proxy")
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
