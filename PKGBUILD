# Maintainer mattf <matheusfillipeag@gmail.com>

pkgname=mangle
pkgver=v.0.1
pkgrel=1
pkgdesc="Mangle programming language"
url="https://github.com/matheusfillipe/mangle"
license=('MIT')
arch=('x86_64')
md5sums=('SKIP')
makedepends=()
depends=()
provides=(mangle)

source=(
  "git+$url"
)
md5sums=('SKIP')


pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  echo "Future release"
}

build () {
  echo "Comming soon"
}

package () {
  install -Dm755 curl-impersonate "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 curl_* "${pkgdir}/usr/bin/"
  install -Dm755 libcurl-impersonate.so.$ver "${pkgdir}/usr/lib/libcurl-impersonate-chrome.so.$ver"
}
