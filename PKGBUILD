# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname="gitmal-bin"
_pkgname="${pkgname/-bin/}"
pkgver=1.0.2
pkgrel=1
pkgdesc="A static page generator for repos"
url="https://github.com/antonmedv/gitmal"
license=("MIT")
arch=("x86_64" "aarch64")
source=("https://raw.githubusercontent.com/antonmedv/gitmal/refs/heads/master/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/gitmal_linux_amd64")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/gitmal_linux_arm64")
b2sums=('7cbe56f714a5c236119150937071d4dc490ffe526b590e873b2d046e6c48d796c8fdfe37c3d1c78e2942ee9ce41d873516aca0f0d15ce7f6962dc8295a7e58bc')
b2sums_x86_64=('9fc31c2693cb774750e6094f28203b1fa25bb6357d3431b5bf1cee4e046b2ffb93ab03806bffbf70682fa77c3ef45e90b803cb3c767d64176c2042779ec04794')
b2sums_aarch64=('83f78546c584e1fe14d183ea7097273a0d7b949e4c68c02cec11d8a91d031b12edfae7288cf9d76bf0d6be7c6444de0c3dfa5fd29f9ad1fe5a10b855eafbbaaa')

package(){
 install -D -m 755 "$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
