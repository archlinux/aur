# Maintainer: 4679kun <4679kun@outlook.com>
# Maintainer: meepzh <meep.aur@meepzh.com>

pkgname=minify
pkgver=2.3.4
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
source_x86_64=("https://github.com/tdewolff/minify/releases/download/v2.3.4/minify_2.3.4_linux_amd64.tar.gz")
source_i686=("https://github.com/tdewolff/minify/releases/download/v2.3.4/minify_2.3.4_linux_386.tar.gz")
sha256sums_x86_64=('f35f1cc0ad00c928da83d705cf822013d3ae5fd83ac90d0c895610d841d82ffe')
sha256sums_i686=('d62a00049885f6dabcd03ac036b16689fc76cc8d00b847172579918c4726d329')

package() {
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

