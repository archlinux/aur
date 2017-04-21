# Maintainer: 4679kun <4679kun@outlook.com>

pkgname=minify
pkgver=2.1.1
pkgrel=1
pkgdesc="Minify CLI for HTML, CSS, JS, JSON, SVG and XML"
arch=('x86_64' 'i686')
url="https://github.com/tdewolff/minify"
license=('custom')
if [ "$CARCH" = "i686" ]; then
  _PKGARCH=386
else
  _PKGARCH=amd64
fi
source_x86_64=("https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-amd64.tgz")
source_i686=("https://bin.equinox.io/c/dhgbqpS8Bvy/minify-stable-linux-386.tgz")
md5sums_x86_64=('c8092a5d15bd998a6a668628fd60c063')
md5sums_i686=('e4980398748212dfa4b2bd2f6626cb28')

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
