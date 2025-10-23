# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.3
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client (binary version)"
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=("GPL3")
arch=("x86_64" "aarch64" "armv7h")
provides=("teams-for-linux")
conflicts=("teams-for-linux"
           "teams-for-linux-appimage"
           "teams-for-linux-git"
           "teams-for-linux-wbundled-electron"
          )
depends=("gtk3" "libxss" "nss")
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_armv7l.deb")
b2sums_x86_64=('5eb7d01c44fc5b79378c1fc32d495c768c559db3543f84170cef83cf6fff7f761fcb7ddac8f1fd3318d2079e08f8f5b643cb6bcb4f1c2823e4ffe3679aba64a0')
b2sums_aarch64=('96a0f68ac9378fde9de5b5f7a4c6bea550725e0d892b75b13835fcd7260d7a4f02c2be8050ae7ffa9e6c1c6c9020e2da9eca155a350aa88aa7bfdf04af360380')
b2sums_armv7h=('eb31095a6ad397d86021a644c1df3a1d0023407a3ceb5297afd9b3951dd37e33d7d3a20c02afd5ee6295c18c846f958c4db8703ba1ac66068b216cff410f548c')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
