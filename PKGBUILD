# Maintainer: oeyoews <jyao4783@gmail.com>
pkgname=tidgi
pkgver=0.7.9
pkgrel=1
pkgdesc="About
TidGi is an privatcy-in-mind, automated, auto-git-backup, freely-deployed Tiddlywiki knowledge management Desktop note app, with local REST API."
arch=(x86_64)
url="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL2')
source=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
md5sums=('SKIP')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
}
