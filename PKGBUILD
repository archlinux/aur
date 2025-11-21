# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.14
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
b2sums_x86_64=('7746047dd81af79848fb564bf57a74c45c929e04cf7ae190d52e3a06efa75bda43380defd6a18026ab20df0fcfc18b5d6b2b68820a4d90e19dd8e710e5c8d919')
b2sums_aarch64=('db5baf5fe70005d6453fa375684c9c396afa31d64ec6cecd92cb47c66d1e4a50820d340cfb2beb6bc84fa7a598b548969118e529a0348d7c90ca60d8ebae4f56')
b2sums_armv7h=('d1f7b3ca89ccae6bd042d30088c74f2eb21feefd81e0a4528faed17c82ad0c3fa30f0fa86fbc0c221d69c4a89a3a3abea7c61289b8a993461a7ff3ec347e7329')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
