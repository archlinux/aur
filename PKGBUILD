# Maintainer: brionical27 <brionical@proton.me>
pkgname=kh-melonmix-extras
pkgver=0.1.0
pkgrel=1
pkgdesc="this contains all of the extras for Kingdom Hearts Melon Mix, such as cutscenes or audio packs"
arch=(x86_64)
url="https://github.com/Brionical27/KHMelonMix-Extras"
license=('GPL')
depends=('kh-melonmix-bin')
makedepends=('git' 'git-lfs') 
provides=("kh-melonmix-extras")
package() {
[ -d "$pkgname-*" ] && rm -rf "$pkgname-*"
git clone --branch v$pkgver --depth 1 https://github.com/Brionical27/KHMelonMix-Extras "$pkgname-$pkgver"
mkdir -p $pkgdir/opt/Kingdom\ Hearts\ Melon\ Mix
cp -r "$srcdir/$pkgname-$pkgver/assets" "$pkgdir/opt/Kingdom Hearts Melon Mix"
}
