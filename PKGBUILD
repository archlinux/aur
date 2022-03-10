# Maintainer: FlamesX-128 <glowingorangeflames@gmail.com>
pkgname='ymp3cli.sh-git'
_pkgname='ymp3cli.sh'
pkgver=r12.bec2897
pkgrel=1
epoch=
pkgdesc='Inspired in "paij0se/ymp3cli", "ymp3cli.sh" is a cli created in "shell script" to listen or download music/songs.'
arch=('any')
url='https://github.com/FlamesX-128/ymp3cli.sh'
license=('MIT')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=('curl' 'diff' 'flyingrub-scdl' 'mpv' 'tput' 'spotdl' 'youtube-dl')
provides=('ymp3cli.sh')
conflicts=('ymp3cli.sh')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname%-VCS}"
  install -Dm755 ./ymp3cli.sh "$pkgdir/usr/bin/$_pkgname"
}
