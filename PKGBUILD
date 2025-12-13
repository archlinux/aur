# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname="gitmal-bin"
_pkgname="${pkgname/-bin/}"
pkgver=1.0.1
pkgrel=1
pkgdesc="A static page generator for repos"
url="https://github.com/antonmedv/gitmal"
license=("MIT")
arch=("x86_64" "aarch64")
source=("https://raw.githubusercontent.com/antonmedv/gitmal/refs/heads/master/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/gitmal_linux_amd64")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/gitmal_linux_arm64")
b2sums=('7cbe56f714a5c236119150937071d4dc490ffe526b590e873b2d046e6c48d796c8fdfe37c3d1c78e2942ee9ce41d873516aca0f0d15ce7f6962dc8295a7e58bc')
b2sums_x86_64=('1ddb73cc454f6869f06d2a92cb310ea91677a4689edbc74af5671995124c05e12058bb5e25820ed48b01cd2d8a0ef11769784226a522655c0e143394003171a2')
b2sums_aarch64=('e17817830e38404633b9d12c9cd95c8998e1607a64961a3f63a5c9a95e29825fd1cd38e64563286e49155da6971508a0db9c218515cadfb7e3a1bb3fac046988')

package(){
 install -D -m 755 "$_pkgname-$pkgver-$CARCH" "$pkgdir/usr/bin/$_pkgname"
 install -D -m 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
