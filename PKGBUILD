# Maintainer: Jef Roosens
# Contributor: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan

pkgbase='cinny-desktop-bin'
pkgname='cinny-desktop-bin'
pkgver='2.0.4'
pkgrel='2'
pkgdesc='Cinny is a matrix client focusing primarily on a simple, elegant and secure interface.'
arch=('x86_64')

url='https://cinny.in/'
license=('MIT')

# https://tauri.studio/v1/guides/getting-started/prerequisites#1-system-dependencies
depends=(
    'webkit2gtk'
    'openssl'
    'gtk3'
    'appmenu-gtk-module'
    'libappindicator-gtk3'
    'librsvg'
    'libvips'
    'sqlite'
    'gst-plugins-good'
)
conflicts=('cinny-desktop')

source_x86_64=("https://github.com/cinnyapp/cinny-desktop/releases/download/v${pkgver}/cinny_${pkgver}_amd64.deb")
sha256sums_x86_64=('b9d8cb958653a8e05317d1fb37ac099c8a26140790bc0733984a778a61362066')
install="${pkgname}.install"

package() {
	tar -xzf 'data.tar.gz' -C "${pkgdir}"
}
