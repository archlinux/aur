# Maintainer: systemlayer <174369883+systemlayer@users.noreply.github.com>
pkgname=raptor-cage-bin
pkgver=1.0.8
pkgrel=1
pkgdesc='Your machine, your games, your rules'
url='https://github.com/systemlayer/raptor-cage'
source_x86_64=("https://github.com/systemlayer/raptor-cage/releases/download/1.0.8-2610040758/raptor-cage-1.0.8-2610040758.tgz")
arch=('x86_64')
license=('MIT')
depends=('bubblewrap' 'steam')
optdepends=('mangohud: vulkan overlay' 'gamescope: spoof resolutions and limit framerates')
sha256sums_x86_64=('9ca70c34e909cf7283211524695f0fa1639f7b3ef2938fef6dff13c2db219560')

package() {
  cd "$srcdir/"
  install -Dm755 rcage "${pkgdir}/usr/bin/rcage"
}
