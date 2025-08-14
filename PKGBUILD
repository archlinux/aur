# Maintainer: Jay Chu <tothesong[at]gmail[dot]com>
# Co-Maintainer: Jesse R Codling <codling[at]umich.edu>

pkgname=visual-studio-code-cli-bin
pkgver=1.103.1
pkgrel=1
pkgdesc="The Visual Studio Code Server is a service you can run on a remote development machine, like your desktop PC or a virtual machine (VM)."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://code.visualstudio.com/"
license=('custom: Microsoft EULA')
provides=('code' 'vscode')
conflicts=('code' 'vscode')
source_x86_64=(code_cli_x64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/cli-linux-x64/stable)
source_aarch64=(code_cli_arm64_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/cli-linux-arm64/stable)
source_armv7h=(code_cli_armhf_${pkgver}.tar.gz::https://update.code.visualstudio.com/${pkgver}/cli-linux-armhf/stable)
sha256sums_x86_64=('79faa959cc9d0d38abdad900abe762c91021b1096b37f2df18f783ca8bd1fe71')
sha256sums_aarch64=('c6c77c1ab00b2595c72dec8ae03984f6d1bf56ff79765e14e69adb22768f31c2')
sha256sums_armv7h=('64b32c1e9654820504c5277be57e42acf2eae06ebf1e59f9ac0cc3aea7e97c4d')


package() {
  install -Dm755 -t "${pkgdir}/usr/bin/" code
}
