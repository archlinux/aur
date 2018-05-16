# Maintainer: neodarz <neodarz@neodarz.net>

pkgname=grv
pkgver=v0.1.3
pkgrel=1
pkgdesc="terminal interface for viewing git repositories"
arch=('i686' 'x86_64')
url="https://github.com/rgburke/$pkgname"
license=('GPL-3.0')
depends=(ncurses readline curl)
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/rgburke/grv/releases/download/$pkgver/grv_"$pkgver"_linux64")
noextract=()
sha512sums=('f65d558c0a5a9bfad6b34220b5df36584af7c021780758dbdc8714bb8fa5326a844f79e9a731aae3217ec22009583d6ca590dfe980dfccc1152573807952999a')

package() {
    install -Dm755 "grv_"$pkgver"_linux64" "$pkgdir/usr/bin/$pkgname"
}

