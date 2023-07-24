# Maintainer: bargst <bargst dash archlinux at wasabout dot net>

pkgname=perkeep-bin
pkgver=0.11
pkgrel=1
pkgdesc='Perkeep (née Camlistore) is a set of open source formats, protocols, and software for modeling, storing, searching, sharing and synchronizing data in the post-PC era'
arch=('x86_64')
url='https://perkeep.org/'
license=('Apache')
depends=('glibc')
provides=('perkeep')
conflicts=('perkeep')

source=("https://perkeep.org/dl/perkeep-$pkgver-linux.tar.gz")
sha256sums=('b3fc257a3831e7782dd76731f286d3e914c2aac37a198eee7c7f076909eb6fb9')

package() {
  install -Dm755 -t "$pkgdir"/usr/bin/ perkeepd pk pk-get pk-mount pk-put publisher scancab scanningcabinet
}
