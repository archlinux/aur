# Maintainer: aliu <aar on liu0130 @ g mail.com>
pkgname=openasar-install
pkgver=1.3
pkgrel=1
pkgdesc='Smart and interactive installer script for OpenAsar for Discord'
arch=('any')
url="https://github.com/aaronliu0130/Better-OpenAsar-Installer"
license=(GPL-3.0-or-later)
depends=('discord')
source=('https://github.com/aaronliu0130/Better-OpenAsar-Installer/raw/114d1f4/installer/openasar-install.bash')
b2sums=('16196f5b02688740b1a7a4d44b4728f1baf8e18413d8f1034faa6cbb56e8f7c1849679ed00664b25e2ee0aacb6ff775ffbef6a8c1dba04d8fda6a87cceecab94')

package() {
	install -Dm755 openasar-install.bash "${pkgdir}/usr/bin/openasar-install"
}
