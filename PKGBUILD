# Maintainer: Alexeyev Vitaly
# Сгенерировано syngui package -f aur --workspace из syngui-release.toml — правки делать там.
pkgname=linux-legion-bin
pkgver=0.2.0
pkgrel=1
arch=('x86_64')
url='https://github.com/VitaminDB/linux-legion'
license=('MIT')
pkgdesc='Control center for Lenovo Legion laptops: power modes and profiles, fans, Spectrum RGB lighting, battery (Vantage for Linux)'
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'vulkan-icd-loader' 'hicolor-icon-theme' 'gcc-libs' 'glibc' 'gtk3' 'libayatana-appindicator' 'xdotool')
optdepends=('libx11: X11 session'
            'libxcursor: cursors in X11'
            'nvidia-utils: NVIDIA GPU monitoring')
provides=('linux-legion')
conflicts=('linux-legion' 'linux-legion-git')
install=linux-legion.install
options=('!strip' '!debug')
noextract=('linux-legion-0.2.0-x86_64.tar.zst')
source_x86_64=("linux-legion-0.2.0-x86_64.tar.zst::https://github.com/VitaminDB/linux-legion/releases/download/v$pkgver/linux-legion-0.2.0-x86_64.tar.zst")
sha256sums_x86_64=('efe213b58291b0a21c1310f4b5913b49ebe66b1b6da1c6fcc8a264548c199cb8')

package() {
    bsdtar -xpf "$srcdir/linux-legion-$pkgver-$CARCH.tar.zst" -C "$pkgdir"
}
