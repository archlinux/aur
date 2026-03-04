pkgname=waybar-hyprspaces-fork-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Prebuilt Waybar fork with hyprspaces paired workspace support"
arch=('x86_64')
url='https://github.com/jtaw5649/Waybar'
license=('MIT')
depends=('glibc' 'waybar')
provides=('waybar-hyprspaces-fork')
conflicts=('waybar-hyprspaces-fork')
options=('!debug')
_release_tag="hyprspaces-v${pkgver}"
_asset="waybar-hyprspaces-fork-x86_64.tar.zst"
source=("${url}/releases/download/${_release_tag}/${_asset}")
sha256sums=('88ab939592cd7b9c4840492e119b307c294814b370dfee162b2ee3acc37a21c1')

package() {
  install -Dm755 "${srcdir}/waybar" "${pkgdir}/usr/lib/hyprspaces/waybar-fork/bin/waybar"
}
