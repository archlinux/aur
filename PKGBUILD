# Maintainer: bargst <bargst dash archlinux at wasabout dot net>

pkgname=perkeep-bin
pkgver=0.10.1
pkgrel=1
pkgdesc='Perkeep (née Camlistore) is a set of open source formats, protocols, and software for modeling, storing, searching, sharing and synchronizing data in the post-PC era'
arch=('x86_64')
url='https://perkeep.org/'
license=('Apache')
depends=('glibc')
provide=('perkeep')

source=("https://perkeep.org/dl/perkeep-$pkgver-linux.tar.gz")
sha256sums=('96a9832efccad5f8037d75870287539382b22dfa5795f113551bd9386def8f88')
         

package() {
  install -Dm755 -t "$pkgdir"/usr/bin/ perkeepd pk pk-get pk-mount pk-put publisher scancab scanningcabinet
}
