pkgname=gzdoom-bin
pkgver=4.14.0
pkgrel=2
pkgdesc='Feature centric port for all Doom engine games'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/gzdoom"
license=('BSD' 'GPL3' 'LGPL3')
depends=('gtk3' 'hicolor-icon-theme' 'libgl' 'libvpx>=1.14' 'libwebp' 'openal' 'sdl2' 'zmusic>=1.1.14')
conflicts=("gzdoom" "gzdoom-git")
makedepends=('unzip')
_pkgrel_x86_64=1
_pkgrel_aarch64=1
sha256sums_x86_64=('86073d5525488b5d87d9e55b260da6ba0d2dba8ddc220e3e088974e85980bcc9')
sha256sums_aarch64=('7e86db0d2c1cbd16bc36d38f026738868cb1bc2c77c38f651e13cd12bda7dc07')
source_x86_64=("https://gitlab.com/linuxbombay/gzdoom/binaries/$pkgver/-/raw/main/gzdoom-$pkgver-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/gzdoom/binaries/$pkgver/-/raw/main/gzdoom-$pkgver-arm64.tar.xz")

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/gzdoom"
    install -dm755 "$pkgdir/usr/share/icons"    
    install -dm755 "$pkgdir/usr/share/licenses" 
    install -dm755 "$pkgdir/usr/share/doc"
    install -dm755 "$pkgdir/usr/share/applications"
    
    cp -r "$srcdir/usr" "$pkgdir"
}
