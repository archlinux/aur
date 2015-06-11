# Maintainer: yesuu zhang <yesuu79@qq.com>

pkgname=gocode-daemon
pkgver=20150303
pkgrel=1
pkgdesc="An autocompletion daemon for the Go programming language (binary only)"
arch=('i686' 'x86_64')
url="https://github.com/nsf/gocode"
license=('MIT')
depends=('go')
source=('https://github.com/nsf/gocode/archive/v.20150303.tar.gz')
md5sums=('d379961598b8a3c4a67a9d26df291c40')

build() {
	cd "${srcdir}/gocode-v.20150303"
	go build -o gocode
}

package() {
	cd "${srcdir}/gocode-v.20150303"
	install -Dm755 gocode "${pkgdir}/usr/bin/gocode"
}
