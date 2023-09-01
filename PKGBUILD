# Maintainer: Emilio Reggi <nag@mailbox.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: tee < teeaur at duck dot com >

pkgname=walk-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="Terminal file manager"
arch=('x86_64' 'arm')
url="https://github.com/antonmedv/walk"
license=('MIT')
provides=('llama')
#conflicts=('llama')
source=("LICENSE-$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("walk-$pkgver-x86_64::$url/releases/download/v$pkgver/walk_linux_amd64")
source_arm=("walk-$pkgver-arm::$url/releases/download/v$pkgver/walk_linux_arm64")
sha256sums=('d63a8c4f17dde022f8d1f96a4b2c744821f65bcae926b4de4ee77230a70cdee4')
sha256sums_x86_64=('aa7e2823562ed42694dd2df8bf7b564f1626ab39ad454e052669f9c8c268bff3')
sha256sums_arm=('2d23441152fab4ee97d2bdd02f25afb1bda422de4692443344fe371e40ceedb1')

package() {
   install -D "walk-$pkgver-$CARCH" "$pkgdir/usr/bin/walk"
   install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
