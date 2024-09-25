# Maintainer: tee < teeaur at duck dot com >
_pkg=jql
pkgname=jql-bin
pkgver=7.2.0
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
            'a2355ee0d0ccf7eed2739b1b7786196a1331510ce9e391c65d8f29ec3893b778'
            '4392ce81361f934550126c79d3ad447292fc48e44ba8dd1552951fff856c3b09')
sha256sums_arm=('fe9a6d97a06708388f2969c1aad303f782aff9c29a9e1c292feeabbb4b13ef6e')
sha256sums_x86_64=('eb77e42f3650a1d64e8612509c2fbaeea14e85a7131f79e0ed90f965339807e8')

package() {
  install -Dm755 "$_pkg" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
