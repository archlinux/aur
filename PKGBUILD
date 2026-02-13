pkgname=waybar-hyprspaces-fork-bin
pkgver=0.1.2
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
sha256sums=('d9fa173f6f64dc67e65f00f09490efaabc50c0c88afa2e25f572af6c54a841a3')

package() {
  install -Dm755 "${srcdir}/waybar" "${pkgdir}/usr/lib/hyprspaces/waybar-fork/bin/waybar"
}
