# Maintainer: Théo Grivel <grivel * theo at protonmail * com>
pkgname=webserv
pkgver=0
pkgrel=1
pkgdesc="This is a web server written in C++98 from a student project"
url="https://github.com/t-h2o/webserv"
_gitname=webserv
depends=('gcc')
makedepends=('make' 'git')
arch=(x86_64)
license=('custom')
source=("git+https://github.com/t-h2o/webserv")
sha256sums=('SKIP')

prepare() {
	cd "$_gitname"

}
build() {
	cd "$_gitname"
	make
}
package() {
	cd "$_gitname"
	sudo cp webserv /usr/bin/
}
