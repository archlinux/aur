# Maintainer: tee < teeaur at duck dot com >
_pkg=jql
pkgname=jql-bin
pkgver=7.1.8
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
            '789d4b7fd75b5b294764c60d27ff2522330ebd7f095a9ddda7bad202afbb5f9b'
            '5be55145949b1650b8f4bbd5299f18d8d5dcc77ace328affb16d4f847003845c')
sha256sums_arm=('6beee2fb43c6e01bb40c28420032dd7efd44a6275b5275e82fb7ff41a8eba752')
sha256sums_x86_64=('b711c98dba704782eda5e7500cdd5c90b7f9df3d32c1a77f7ac9a197c67684af')

package() {
  install -Dm755 "$_pkg" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
