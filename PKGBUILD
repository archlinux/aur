# Contributor: Emilio Reggi <nag@mailbox.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=walk-bin
pkgver=1.10.0
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
sha256sums_x86_64=('2ab9b53ff8c5541caba13eccb6e60e34ecc184914d59b90d5b137c93df2b39aa')
sha256sums_arm=('fe88b6f2fdbd8e7df6ed37f477b98ed1794785955f4e52564cf3d604cbc03a56')

package() {
   install -D "walk-$pkgver-$CARCH" "$pkgdir/usr/bin/walk"
   install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
