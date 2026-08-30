# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.18.1
pkgrel=1
pkgdesc='Unofficial Microsoft Teams for Linux client (binary version)'
url='https://github.com/IsmaelMartinez/teams-for-linux'
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64' 'armv7h')
provides=('teams-for-linux')
conflicts=('teams-for-linux'
           'teams-for-linux-appimage'
           'teams-for-linux-git'
           'teams-for-linux-wbundled-electron'
          )
depends=('gtk3' 'libxss' 'nss' 'alsa-lib' 'nodejs')
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_armv7l.deb")
b2sums_x86_64=('01e12d7b3e6e562beba7fba52a00ea4a7c2a6b7b3d2d05205f906e98eeccbd8a95b02ca7693cd1c674747ec435a7af91d810ecb38d92132e5f8904c43f2f0e86')
b2sums_aarch64=('39b521d4fb4be66513e52fedd37e0527e32042e0878462ad850fe081f9c33bd67409fb6e412ac5b7d3a3c4383a2d70f2f23626096632b2dd18749c58b4d14388')
b2sums_armv7h=('6274abe18c2e0a05b944d3a2665952a99ffa89f9963c14e884277dd1c0a4aaf01dad2799735c9572170157b454136a87d9f7fb56f4890d95997d02b5eca1f2f4')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
