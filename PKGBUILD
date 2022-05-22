# Maintainer: Jef Roosens
# Contributor: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan

pkgbase='cinny-desktop-bin'
pkgname='cinny-desktop-bin'
pkgver='2.0.3'
pkgrel='1'
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
)
conflicts=('cinny-desktop')

source_x86_64=("https://github.com/cinnyapp/cinny-desktop/releases/download/v${pkgver}/cinny_${pkgver}_amd64.deb")
sha256sums_x86_64=('bd4a9d58f2fa2bf1b7e1f9f7b2149840e9a1cfd3f2363bedcc48cd0f17f64ad2')
install="${pkgname}.install"

package() {
	tar -xzf 'data.tar.gz' -C "${pkgdir}"
}
