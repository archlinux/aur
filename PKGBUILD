# Maintainer: aliu <aar on liu0130 @ g mail.com>
pkgname=openasar-install
pkgver=1.2.2
pkgrel=1
pkgdesc='Smart and interactive installer script for OpenAsar for Discord'
arch=('any')
url="https://github.com/aaronliu0130/Better-OpenAsar-Installer"
license=(GPL-3.0-or-later)
depends=('discord')
source=('https://github.com/aaronliu0130/Better-OpenAsar-Installer/raw/114d1f4/installer/openasar-install.bash')
sha256sums=('9d8f265df7e78d01919e0b24208154c04abafae6bb31b1b8d3cc93f5e9473fa8')

package() {
	install -Dm755 openasar-install.bash "${pkgdir}/usr/bin/openasar-install"
}
