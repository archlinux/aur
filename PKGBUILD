# Contributor: Emilio Reggi <nag@mailbox.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=walk-bin
pkgver=1.12.0
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
sha256sums_x86_64=('157f7a4ec8f5315d66d5695671dcb902d4282edb42077022e80fd9fe305b2d06')
sha256sums_arm=('21bd7a90bd72547dccb228ebb42815de8e7defe8c92fa2619f1f3d52266777ae')

package() {
   install -D "walk-$pkgver-$CARCH" "$pkgdir/usr/bin/walk"
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
