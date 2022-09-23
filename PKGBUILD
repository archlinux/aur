# Maintainer: DrakeTDL <everyone@disroot.org>

pkgname=goosemod-installer
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple script to install GooseMod (A Discord Mod)"
arch=(any)
url="https://goosemod.com/"
license=('GPL')
depends=(python)
optdepends=(discord discord-ptb discord-canary discord-development)
source=("${pkgname}")
sha256sums=('45636f8fa18deae6847497d8a88d70afbcd70cae38d4c325454d98457960a712')

package() {
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
