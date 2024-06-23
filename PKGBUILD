# Contributor: Emilio Reggi <nag@mailbox.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=walk-bin
pkgver=1.9.0
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'arm')
url="https://github.com/antonmedv/walk"
license=('MIT')
provides=('llama' 'walk')
replaces=('llama')
conflicts=('walk')
source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("walk-$pkgver-x86_64::$url/releases/download/v$pkgver/walk_linux_amd64")
source_arm=("walk-$pkgver-arm::$url/releases/download/v$pkgver/walk_linux_arm64")
sha256sums=('d63a8c4f17dde022f8d1f96a4b2c744821f65bcae926b4de4ee77230a70cdee4')
sha256sums_x86_64=('64a4186f93a268081e21bb3b8919780febe8517c9370f6320f12f6fb3a77d2f4')
sha256sums_arm=('e8080b28cdde82b4957fa345279afb64756a397943d74e57c6ee5b2848f35943')

package() {
   install -D "walk-$pkgver-$CARCH" "$pkgdir/usr/bin/walk"
   install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
