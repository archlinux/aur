# Maintainer: Jef Roosens
# Contributor: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan

pkgname='cinny-desktop-bin'
pkgver='2.2.0'
pkgrel='1'
pkgdesc='Matrix client focusing primarily on a simple, elegant and secure interface (binary release)'
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
provides=('cinny-desktop')

source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/cinnyapp/cinny-desktop/releases/download/v${pkgver}/Cinny_desktop-x86_64.deb")
sha256sums_x86_64=('52f36f7e039aa86d8fde997b707c0fd04edff092cca35103883032d39a49544e')
sha512sums_x86_64=('3af1dfa573f2aa4ab2a38ac6355f2821dae043ec0bd07a877a9fa72aee12e9ecc68f3e4f73d31984d105e73a623f18151f67ca023693158acd4fc329bf90f462')

install="${pkgname}.install"

package() {
	tar -xzf 'data.tar.gz' -C "${pkgdir}"
}

# vim: ft=bash
