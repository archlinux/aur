# Maintainer: Marcin Kornat <rarvolt+aur@gmail.com>

pkgname=leetgo
pkgver=1.4
pkgrel=1
pkgdesc="Best LeetCode friend for geek."
arch=('x86_64')
url="https://github.com/j178/leetgo"
license=('MIT')
source=("https://github.com/j178/leetgo/releases/download/v${pkgver}/leetgo_linux_x86_64.tar.gz")
sha256sums=('4c533252dbae45eeb1b540617011931bb2bfe0b958be0839d9b5a71a60c2fd00')

package() {
	install -Dm755 leetgo "${pkgdir}/usr/bin/leetgo"
}
