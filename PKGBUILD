# Maintainer: systemlayer <174369883+systemlayer@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.7
pkgrel=1
pkgdesc='Run games in a secure sandbox'
url='https://github.com/systemlayer/raptor-cage'
source_x86_64=("https://github.com/systemlayer/raptor-cage/releases/download/1.0.7-2610021745/raptor-cage-1.0.7-2610021745.tgz")
arch=('x86_64')
license=('MIT')
depends=('bubblewrap' 'steam')
optdepends=('mangohud: vulkan overlay' 'gamescope: spoof resolutions and limit framerates')
sha256sums_x86_64=('26b268e75a41cc069c65fc7172bbef17ff00077a15a06ad48519e445137327b6')

package() {
  cd "$srcdir/"
  install -Dm755 raptor-cage "${pkgdir}/usr/bin/rcage"
}
