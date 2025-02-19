# Contributor: Emilio Reggi <nag@mailbox.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=walk-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'arm')
url="https://github.com/antonmedv/walk"
license=('MIT')
provides=('llama' 'walk')
replaces=('llama')
conflicts=('walk')
source=("$url/raw/v$pkgver/LICENSE")
source_x86_64=("walk-$pkgver-x86_64::$url/releases/download/v$pkgver/walk_linux_amd64")
source_arm=("walk-$pkgver-arm::$url/releases/download/v$pkgver/walk_linux_arm64")
sha256sums=('d63a8c4f17dde022f8d1f96a4b2c744821f65bcae926b4de4ee77230a70cdee4')
sha256sums_x86_64=('7c3b6e28fd0eee20170a07be5ceae001e466d8948b32feb005c447f4cf7c3c21')
sha256sums_arm=('42664c11d54d1e7f7ca5131c34197de120f03d535238d6cadbe03bba8303ebc8')

package() {
   install -D "walk-$pkgver-$CARCH" "$pkgdir/usr/bin/walk"
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
