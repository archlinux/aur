# Maintainer: 4679kun <4679kun@outlook.com>
# Maintainer: meepzh <meep.aur@meepzh.com>

pkgname=minify
pkgver=2.1.5
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
md5sums_x86_64=('be4cf443c2778e2c81badfe94c5af46f')
md5sums_i686=('08354a1fbc845a8c81c7886e2d6b3163')

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
