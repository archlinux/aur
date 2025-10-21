# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.0
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
b2sums_x86_64=('81cfbd6942c3feb4b734da820d710a793dbd2d72e84c91ce4e176f2269ed96f6a05befe8ee5336a534820e132ab69bba921b238e9652704f2fd614958d2cc3d7')
b2sums_aarch64=('4a18f6f1f393d5fd7523d9fab57b5b3c3c26d5036e164a1cc402536b1a1d03018adca6dd612680ed3a74526a5c2c5d62d6ff1e1b5a4876e29495b2eb58625b97')
b2sums_armv7h=('bcf5c25b12e36028c292fd1aba583bf0d41d4cdafe797dd2f1d4694826d00adf78bcee05bfac34c3ae400f689cd77c1d78862fe2a7eb4c6f6d53ae1baef79384')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
