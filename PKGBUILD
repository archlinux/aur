# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.10
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
b2sums_x86_64=('3c482993816ba8407dbc63232b4cc915c5bd658cecda647643367581b60cd2f737aa57d80c8c4bcda2f362f4b5a2dca0eb12f14c16038369f0207b4375bd0f8f')
b2sums_aarch64=('9575ac2b983f9e9d5955faa2a438b695e28f5e768a92c1551fdb33be693a0ab1f2a6fb88b1ad7afe0a6d22439c903064cd28cef358e9f43e20daf07b30e41c38')
b2sums_armv7h=('c2616e14f57533c7aec6d0f7d6dcc58db4a907b72df14c3327253640fc86aa73d26e1034bfe42fcd746bf4fd11f8c8803e4551cf9c3398d2eda49e4df9ee2777')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
