# Maintainer: tee < teeaur at duck dot com >
_pkg=jql
pkgname=jql-bin
pkgver=8.0.8
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
            '886c5501099dc79263eed60b20c74912caf20f6e0f6141dec7e66de6d5d118ef'
            '3524bbd52e46c2c3ef3d6d6b2c9a82a404540ef399c5c750a573b355b72c4ba7')
sha256sums_arm=('bb73dbeeb82e9e63079021229911f5c3ffdeefffbd63b3de55532951a008c925')
sha256sums_x86_64=('968c1931efa8f1c7bc4a91bbb9de3a92c591a528b6e47a9ed75a3b34bbb7c629')

package() {
  install -Dm755 "$_pkg" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
