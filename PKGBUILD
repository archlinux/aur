# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.17.1
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
b2sums_x86_64=('28e93ea97daebe4f16724a47d6e1c655ee3e4e7ba775e8b7a3671a5cf898e213ff0cabcae24e47033f67914e292a4eb795c6cbca30589b930c5e34607b70c048')
b2sums_aarch64=('f9981b0e6161c2f074b3e4960f4965b0ed3a3194d65a178d8f9fe0379e88462ca8272bc3f5487c270221d2e07c76111e85e160a77e8b509d215a2bd33f9d8115')
b2sums_armv7h=('83999a0350389c347a6306ce54ab1760f8857071449d8c6890dfaa32be088bcf894bc8e3bb55c11a6fbcf6e3bfe2d6e1a1567d69e8815d523575f1693f0f2115')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
