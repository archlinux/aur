# Maintainer: ItzSelenux <itszariep@outlook.com>
pkgname=xwinwrap-0.9-bin
pkgdesc="xwinwrap 0.9 (useful for ghostlexly-gpu-video-wallpaper)"
pkgver=0.9
pkgrel=1
arch=('x86_64')
depends=('libx11' 'libxext' 'libxrender')
provides=('xwinwrap')
conflicts=('xwinwrap')
license=(custom)
url="https://github.com/mmhobi7/xwinwrap/"
source=("https://github.com/mmhobi7/xwinwrap/releases/download/v0.9/xwinwrap" )
sha256sums=('da043b08e229282fbdf6d00753b86ea69cf0c0a1d2162f78b93d1f991a1cbd19')


package() {
install -Dm755 "xwinwrap" -t "$pkgdir/usr/bin/"
}

