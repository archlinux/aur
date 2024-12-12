# Maintainer: tee < teeaur at duck dot com >
_pkg=jql
pkgname=jql-bin
pkgver=8.0.2
pkgrel=1
pkgdesc="A JSON Query Language CLI tool"
url="https://github.com/yamafaktory/jql"
arch=('arm' 'x86_64')
license=('MIT' 'APACHE')
provides=('jql')
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
            'f6ca804cd86f1f05879ee3e2d19e34206c1103cfb8c25ac5f7dc3faab3e8e876'
            'e9a05458486bbc730f985956af3609ac35d4d7664a48b6ad8fcc0f2483e311b3')
sha256sums_arm=('f992d9915832d0988b520ccf434e00463d96edd32350e32c495538845e3e77a8')
sha256sums_x86_64=('f05dc70d5ac1f4f89a9e43d5f36765b22ea6f005cd21c64b153014375d7f4b23')

package() {
  install -Dm755 "$_pkg" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
