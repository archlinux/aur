# Maintainer: Jef Roosens
# Contributor: krazykirby99999 krazykirby99999-at-gmail-dot-com
# Contributor: ajbura, hbarsaiyan

pkgname='cinny-desktop-bin'
pkgver='2.2.2'
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
sha256sums_x86_64=('4dd2b156f873e834c9f59493fce05cdfb0dc1fd969a0aad8e723fcb244cef5e4')
sha512sums_x86_64=('2fe003896c4f5b93f2db9e8b54fda28ca7cfadb0e1f354ab689aeb9bc458cbc6d78ce46616d6238e87577214295b3186db70022e8950e7cd6c1050637b4694b9')

install="${pkgname}.install"

package() {
	tar -xzf 'data.tar.gz' -C "${pkgdir}"
}

# vim: ft=bash
