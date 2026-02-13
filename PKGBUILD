pkgname=waybar-hyprspaces-fork-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Prebuilt Waybar fork with hyprspaces paired workspace support"
arch=('x86_64')
url='https://github.com/jtaw5649/Waybar'
license=('MIT')
depends=('glibc' 'waybar')
provides=('waybar-hyprspaces-fork')
conflicts=('waybar-hyprspaces-fork')
_release_tag="hyprspaces-v${pkgver}"
_asset="waybar-hyprspaces-fork-x86_64.tar.zst"
source=("${url}/releases/download/${_release_tag}/${_asset}")
sha256sums=('83c3117469b747a4a229e748388c365170f9f88502a2d51b5673c685b8e7df78')

package() {
  install -Dm755 "${srcdir}/waybar" "${pkgdir}/usr/lib/hyprspaces/waybar-fork/bin/waybar"
}
