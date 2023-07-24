# Maintainer: tee < teeaur at duck dot com >
_pkg=jql
pkgname=jql-bin
pkgver=7.0.2
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
            'f9129a3af64291c89da907e5ce2b657091ab864423c2596082d83ef14dc6e30a'
            'eb35807d38b317916bba13340cc0574e4695bbbf3a96d9dea1264b57daf9a345')
sha256sums_arm=('ca905b1205a53aca3cefd39ebccbf4ab55a423d9699138bae653272529bb2fb4')
sha256sums_x86_64=('7c27b446125593e96e2cae4456fa89d2ecddb03752ad76aba68d236e27b3fb57')

package() {
  install -Dm755 "$_pkg" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
