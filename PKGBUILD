# Maintainer: sbw <sbw@sbw.so>
# Contributors: sbw

pkgname=haproxy-shadowsocks-checker
pkgver=1.0.0
pkgrel=1
pkgdesc="HAProxy service checker for shadowsocks"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'aarch64')
url="https://github.com/sbwtw/haproxy-shadowsocks-checker"
license=('MIT')
depends=('python3')

source=("git+https://github.com/sbwtw/haproxy-shadowsocks-checker")
md5sums=('SKIP')

package() {
  cd ${srcdir}/haproxy-shadowsocks-checker
  install -Dm755 haproxy-shadowsocks-checker.py "$pkgdir/usr/bin/haproxy-shadowsocks-checker"
}

