# Maintainer: 4679kun <4679kun@outlook.com>
# Maintainer: meepzh <meep.aur@meepzh.com>

pkgname=minify
pkgver=2.3.1
pkgrel=1
pkgdesc="Minifier CLI for HTML, CSS, JS, JSON, SVG and XML"
arch=('x86_64' 'i686')
url="https://github.com/tdewolff/minify"
license=('MIT')
depends=('glibc')
if [ "$CARCH" = "i686" ]; then
  _PKGARCH=386
else
  _PKGARCH=amd64
fi
source_x86_64=("https://github.com/tdewolff/minify/releases/download/v2.3.1/minify_2.3.1_linux_amd64.tar.gz")
source_i686=("https://github.com/tdewolff/minify/releases/download/v2.3.1/minify_2.3.1_linux_386.tar.gz")
sha256sums_x86_64=('79dacbac822de54cb25568abf5e79f6f97c6b0e82aba199144d3c8b49f04ea30')
sha256sums_i686=('eb62a7533d1a72ecbaf278e9a138ae6fbae901aa7c1c5918b04fbb604a142d45')

package() {
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

