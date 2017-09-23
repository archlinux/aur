# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

pkgname=jwt-go
pkgver=3.0.0
pkgrel=1
pkgdesc="A golang implementation of JSON Web Tokens"
arch=('i686' 'x86_64')
url="https://github.com/dgrijalva/jwt-go"
license=('MIT')
makedepends=('go')
source=("https://github.com/dgrijalva/jwt-go/archive/v${pkgver}.tar.gz")
sha256sums=('af12bdfbfb897c4a5c86aeffd11cab35ee18ab0180b1a6e22e1a1a61d9f70543')

package() {
  cd "$pkgname-$pkgver"
  local base_dir="usr/lib/go/src/github.com/dgrijalva/jwt-go"
  mkdir -p "${pkgdir}/${base_dir}"
  cp -a *.go "${pkgdir}/${base_dir}"
  cp -ra request "${pkgdir}/${base_dir}/request/"
  cp -ra cmd/ "${pkgdir}/${base_dir}/cmd/"
}

