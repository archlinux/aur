# Maintainer: Lázaro Armando <aur at chipojosoft.com>

pkgname=purple-rocketchat
_gitname="purple-rocketchat"
pkgrel=1
pkgver=1
pkgdesc="A purple (pidgin, finch, ...) plugin for RocketChat services"
url="https://bitbucket.org/EionRobb/purple-rocketchat"
arch=('i686' 'x86_64')
license=('GNU')
provides=('purple-rocketchat')
conflicts=('purple-rocketchat')
source=('https://bitbucket.org/EionRobb/purple-rocketchat/get/22b606290368.zip')
md5sums=('SKIP')

pkgver() {
   echo 1
}


depends=( "libpurple" "json-glib" "zlib" "discount>=2.1.7")

build() {
   cd EionRobb-purple-rocketchat-22b606290368
   make
}

package() {
   cd EionRobb-purple-rocketchat-22b606290368
   make DESTDIR="$pkgdir/" install
}
