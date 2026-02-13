pkgname=waybar-hyprspaces-fork-bin
pkgver=0.1.1
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
sha256sums=('71f0ed115eec4bec00179688839dc6a1dcd8d861b4828adc84c6cbc42501387c')

package() {
  install -Dm755 "${srcdir}/waybar" "${pkgdir}/usr/lib/hyprspaces/waybar-fork/bin/waybar"
}
