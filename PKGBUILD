# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.19
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
b2sums_x86_64=('2c31824a0f6efe4314d9aa6b9fc28b46368c1ba2ced24d9a06d23a5bd8939e9ef95d3b1f2c665769a87ad512a0079bac2ee975eff4b3fd7f3232fb0bc0de088b')
b2sums_aarch64=('b28c9d19b3876db0a78ec81b4ef3dc3aa9e4d4b740ca2fd220e0f66058a28adf375f377846ac780e26b806cc8ae9fc2dc7ff3a219743b2d752798634712b1c36')
b2sums_armv7h=('34207a32fabd6067480d7d8c811488fc17b4bea6aaa7f285abc4c4135f3908ca60e258467b87ff367729aa93786d1e547c87d361d70fe7babf3cdf79cd7ce16f')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
