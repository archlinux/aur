# Maintainer: tee < teeaur at duck dot com >
_pkg=jql
pkgname=jql-bin
pkgver=7.0.3
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
arch=('arm' 'x86_64')
license=('MIT' 'APACHE')
source=(
"$url/raw/jql-v$pkgver/LICENSE-MIT"
"$url/raw/jql-v$pkgver/LICENSE-APACHE"
"$url/releases/download/jql-v$pkgver/jql-v$pkgver-arm-unknown-linux-musleabihf.tar.gz.sha256"
"$url/releases/download/jql-v$pkgver/jql-v$pkgver-x86_64-unknown-linux-musl.tar.gz.sha256"
)
source_arm=("$url/releases/download/jql-v$pkgver/$_pkg-v$pkgver-arm-unknown-linux-musleabihf.tar.gz")
source_x86_64=("$url/releases/download/jql-v$pkgver/$_pkg-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('2282729282450a05a4908270ed7685dfc6aa0c3e86f2352cf4daa252c4cf6bf8'
            'a2d0e76cc3e9053d72ab5372728ae01c3c323848db4d3c40d713f9de62be30cc'
            'e17c4467b48a19609725a54381863a5b578a41f4c91c96518b4f44fac86fff6b'
            '3724b39266c099cdeb5d37599fe202074cca80a15915309797b8f398aebdfaee')
sha256sums_arm=('a9b7aa00220fb253df137e28f583a2a92709a09ef459d5fb6c2fa59519930d10')
sha256sums_x86_64=('e059c9d6df8dbd17bc09e7e6c9aa93723c4e29359e5907ab5d2f8df7c7ac9f9a')

package() {
  install -Dm755 "$_pkg" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
