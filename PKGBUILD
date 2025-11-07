# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.11
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
b2sums_x86_64=('2a236df20ed6a72480ce733f8612e99a87b23cef1854ca1258a263f127863b3b68618817e32ae0824a576263defbfee8c31c6547a35594e208ae85a110e332d8')
b2sums_aarch64=('4646e3690900a0914054b572d80f51b9a11b468b477cda1dca73a6ef939f9c166e874a60992f09fb748af6b98292b1338792ababdbb2bd6b1cc12f653e15b918')
b2sums_armv7h=('5ae264eb6dc1829d8eb2cdae7e4b7c1cb6c6644315fbc9ac38ce509a6d88963cfc5ed7857361596fb32baaae684c2c0fd29bdae663ebf99cbd169bdf54e4f6e3')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
