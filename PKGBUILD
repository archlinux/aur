# Maintainer: Ayatale
pkgname=emby-theater-free-bin
pkgver=3.0.20
pkgrel=2
pkgdesc="Emby Theater is an Electron app for Emby. Free version."
arch=('x86_64')
url="https://t.me/EmbyNoisyX/147"
license=('GPL2')
depends=('alsa-lib' 'libglvnd' 'libpulse')
optdepends=('libcec' 'vulkan-mesa-layers')
backup=('etc/emby-theater.conf')
options=('!strip' '!emptydirs')
source=("https://github.com/Brx86/yun/releases/download/2/Emby.for.Linux_3.0.20_v2.3.Carnival.deb")
sha256sums=('0767d32b72fb02c06a904f2ecafcac9617ce28569f6320e09adf465d427c455d')

package(){
    tar -xJ -f data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/usr/share/doc/emby-theater/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
