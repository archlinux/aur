# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=discordrpcmaker-cli

pkgname="${_pkgname}"
pkgver=1.0.0
pkgrel=1
pkgdesc="CLI Helper for DiscordRPCMaker"
arch=('x86_64')
depends=('discordrpcmaker')
url="https://drpcm.t1c.dev/"
license=('GPL')
source_x86_64=("${_pkgname}::https://github.com/thatonecalculator/discordrpcmaker-cli/releases/download/v${pkgver}/${_pkgname}")
noextract=("${_pkgname}")
sha256sums_x86_64=('SKIP')

package() {
	install -Dm755 "$srcdir"/"$_pkgname" "$pkgdir/usr/bin/discordrpcmaker-cli"
}
