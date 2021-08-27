#Maintainer: 7k5x <7k5xlp0onfire@gmail.com>
pkgname=nimf-bin
provides=('nimf')
conflicts=('nimf')
replaces=('nimf')
pkgver=1.3.0
pkgrel=1
epoch=1
depends=(
	'gtk3'
    'libappindicator-gtk3'
    'libxkbcommon'
    'libxklavier'
    'qt5-base'
    'wayland'
)
optdepends=('noto-fonts-cjk: Google Noto CJK fonts')
pkgdesc="Nimf is a lightweight, fast and extensible input method framework."
arch=('x86_64' 'aarch64')
source_x86_64=('https://github.com/hamonikr/nimf/releases/download/1.3.0/nimf_1.3.0hamonikr40.4_amd64.deb')
source_aarch64=('https://github.com/hamonikr/nimf/releases/download/1.3.0/nimf_1.3.0hamonikr40.4_arm64.deb')
sha256sums_x86_64=('b109fd7613e1014bc9f5750a47474ff6b0023fc9a5da0b603ad421bb96c1f11d')
sha256sums_aarch64=('5735e74a338b7e7c46fb1a40687d9510f0472d125a5b4a93818eef9b10b8346f')
package() {
	bsdtar -xf ${srcdir}/data.tar.xz -C "${pkgdir}/"
}
