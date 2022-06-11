## Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=librewolf-extension-bitwarden
pkgver=2022.5.0
pkgrel=1
pkgdesc='Bitwarden addon for Librewolf'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/'
license=('GPLV3')
groups=('librewolf-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3960137/bitwarden_password_manager-$pgver.xpi")
sha512sums=('0979d08a364ec28e111fa515209bdca9e2b549e927a67c7b9d4b611213322c64e0e0cf179a0d33cc587c1fb5d98fca901adec63ec901abc97682e1d572cd9ef9')

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

