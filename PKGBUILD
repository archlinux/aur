# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="gitmal-bin"
_pkgname="${pkgname/-bin/}"
pkgver=1.0.0
pkgrel=1
pkgdesc="A static page generator for repos"
url="https://github.com/antonmedv/gitmal"
license=("MIT")
arch=("x86_64" "aarch64")
source=("https://raw.githubusercontent.com/antonmedv/gitmal/refs/heads/master/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/gitmal_linux_amd64")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/gitmal_linux_arm64")
b2sums=('7cbe56f714a5c236119150937071d4dc490ffe526b590e873b2d046e6c48d796c8fdfe37c3d1c78e2942ee9ce41d873516aca0f0d15ce7f6962dc8295a7e58bc')
b2sums_x86_64=('2387a48fc996d8a08ccf5287ca37fd0d1b281336e1eff89b896791cb3400900a80f1b370be022d4ac7db5b45b2f97d20bfdf6d0bf80d170d4ce3286316595520')
b2sums_aarch64=('c137e0c0c53e1848f44b47e968bf951232720c34617727668fe8887db729d610ea4e8de90b4a6dfd1b3fa47ef7f8109da55e1bad5e225ad7ef620cb31e66074a')

package(){
 install -D -m 755 "$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
