# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.0
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
b2sums_x86_64=('cc0741d1d1a5e25f5fc0cc0b5369f0a838ed074ce2f9a96c8c30c0aacf91419d5d749262311b141c1e5820799e65106b53a1062bdde218295a0928c4f0894b79')
b2sums_aarch64=('f25a824991db54989fd433d8d6c91156c4da1219f5814379f87a74ca770a21cea0586e6fc37a8881e57d9451e734f285a15e80da52c8b5fea0e5ff794b14d47e')
b2sums_armv7h=('990cf8b560675e5627b728095dfaaf0b70a2d1ad6848aa7986f0b7a81ba8e2dab27f2ed148bfac490a7e96cc8a80eba6bf6360fcf7adb380269e66e855cb3b67')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
