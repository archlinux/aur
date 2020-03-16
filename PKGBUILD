# Maintainer: ahbnr <anton dot haubner at outlook dot de>

pkgname=yt-bin
pkgver=r41.383d456
pkgrel=1
pkgdesc="Youtube Terminal UI for music streaming. WIP."
arch=('x86_64')
license=('GPL3')
depends=('ncurses5-compat-libs>=6.1' 'mpv>=1:0.32.0' 'youtube-dl>=2020.01.24')
makedepends=()
replaces=()
conflicts=()
provides=('yt')
backup=()
options=()
install=
source=('https://ahbnr.de/jenkins/job/yt/22/artifact/yt')
noextract=()
md5sums=('SKIP')

build() {
  chmod +x "$srcdir/yt"
}

package() {
  binary="yt"

  strip -s "${binary}"

  mkdir -p "$pkgdir/usr/bin"
  cp "${binary}" "$pkgdir/usr/bin"
}
