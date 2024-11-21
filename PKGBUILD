# Maintainer: tee < teeaur at duck dot com >
_pkg=jql
pkgname=jql-bin
pkgver=8.0.1
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
            '49b8e2d1f7e756c495d0a8ff0fdabc30a3f40df54069496234c810feabb5d6b2'
            'e359ad1130e9056f0f2d0ea657a64a71d81bb186d4e7347c16e26a02a27c747e')
sha256sums_arm=('74e0c5f101fff1167a97dfced6eca1b7c4a37584d8c1a08bceaef4e9fe44f7ee')
sha256sums_x86_64=('0b8afd29107e986ffa471e994acb38907994f83924904e6de9fdf8bef3c2e983')

package() {
  install -Dm755 "$_pkg" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
