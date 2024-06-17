# Maintainer: ExtremTechniker <aur@extremtechniker.io>

pkgname="outlook-for-linux-bin"
pkgver=1.3.13
pkgrel=1
pkgdesc="Unofficial Microsoft Outlook for Linux client (binary version)"
url="https://github.com/mahmoudbahaa/outlook-for-linux"
license=("GPL3")
arch=("x86_64" "aarch64" "armv7h")
provides=("outlook-for-linux")
conflicts=("outlook-for-linux"
           "outlook-for-linux-appimage"
           "outlook-for-linux-git"
           "outlook-for-linux-wbundled-electron"
          )
depends=("gtk3" "libxss" "nss")
source_x86_64=("$url/releases/download/v$pkgver-outlook/outlook-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver-outlook/outlook-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver-outlook/outlook-for-linux_${pkgver}_armv7l.deb")
b2sums_x86_64=('dba96578f8798154826b5224012a055e0bbb4309005f270d1ccabb81c01555d075ebd4ba78d479828d72addf5f5da2b7c7ea210609adca214b4550163d5c7a46')
b2sums_aarch64=('67ffbcc53ee3f2889a3d722f5bfbc96e818c47ecb56db9022e8ece21f3cddd9171b16302b82cec6ad8bf43c79fca53517db5b50a1de053947c6c7953d39eedc8')
b2sums_armv7h=('8de8a54e2a4a9de0b51b98193ba158c7aa088ff60957ed1fd06cd6d75a5eb3e4d05a1e083ccf9508109e1b6c55d7b3881d42ae7d11260d0411b934ec0cab6d50')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}

