# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=botw-save-manager-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="BOTW Save Manager for Switch and Wii U"
arch=('x86_64')
url="https://github.com/DeltaJordan/BotW-Save-Manager"
license=('AGPL-3.0-only')
depends=('dotnet-runtime-6.0')
provides=('botw-save-manager')
conflicts=('botw-save-manager')
options=("!strip")
source=("https://github.com/DeltaJordan/BotW-Save-Manager/releases/download/2.0-alpha/BotwSaveManager-v${pkgver}-linux"     "https://github.com/DeltaJordan/BotW-Save-Manager/releases/download/2.0-alpha/BotwSaveManager.Console-v${pkgver}-linux")

sha256sums=('15e72fe7dbed12a3e262b0822ee396e3da0d4690f34f6c2e0c57f998a88a156a'
            '138f194c4f9a03a28f0f7fee001dc4751b7c1f8751f4af73a749f371dd7a91ed')

package() {
  install -Dm755 ${srcdir}/BotwSaveManager-v${pkgver}-linux ${pkgdir}/usr/bin/BotwSaveManager
  install -Dm755 ${srcdir}/BotwSaveManager.Console-v${pkgver}-linux ${pkgdir}/usr/bin/BotwSaveManager.Console
}

# vim: set sw=2 ts=2 et:
