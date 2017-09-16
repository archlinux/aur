# Maintainer: yesuu zhang <yesuu79@qq.com>

pkgname=gocode-daemon
pkgver=20170907
pkgrel=1
pkgdesc="An autocompletion daemon for the Go programming language (binary only)"
arch=('i686' 'x86_64')
url="https://github.com/nsf/gocode"
license=('MIT')
depends=('go')
source=('https://github.com/nsf/gocode/archive/v.20170907.tar.gz')
sha256sums=('100dbf8a971b10728b7566d430d368a62e60c77b880be96dc0b6364364cac2b4')

build() {
	cd "${srcdir}/gocode-v.20170907"
	go build -o gocode
}

package() {
	cd "${srcdir}/gocode-v.20170907"
	install -Dm755 gocode "${pkgdir}/usr/bin/gocode"
}
