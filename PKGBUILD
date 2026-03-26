# Maintainer: huza(elza) <https://github.com/khuza08>
pkgname=rustify-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern YouTube music player built with Tauri and Rust (Binary Version)"
arch=('x86_64')
url="https://github.com/khuza08/rustify"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'libnm' 'librsvg' 'sqlite' 'yt-dlp' 'ffmpeg')
provides=('rustify')
conflicts=('rustify' 'rustify-git')
source=("rustify-linux-x86_64.tar.gz::https://github.com/khuza08/rustify/releases/download/v$pkgver/rustify-linux-x86_64.tar.gz")
sha256sums=('f628cc95ba239b61bb1c697319649d4df4934333813978ca666fd9da5beb3935')

package() {
  cd "$srcdir"
  
  # The tarball we create in the workflow already has /usr structure
  # So we just use cp -r to put it into $pkgdir
  cp -r usr "$pkgdir/"
}

