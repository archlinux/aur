# Contributor: bargst <bargst dash archlinux at wasabout dot net>
# Maintainer: tee < teeaur at duck dot com >

pkgname=perkeep-bin
pkgver=0.12
pkgrel=1
pkgdesc='Perkeep (née Camlistore) is a set of open source formats, protocols, and software for modeling, storing, searching, sharing and synchronizing data in the post-PC era'
arch=('x86_64')
url='https://perkeep.org'
license=('Apache-2.0')
depends=('glibc')
provides=('perkeep')
conflicts=('perkeep')
#source=("$url/dl/perkeep-$pkgver-linux.tar.gz")
source_x86_64=("$pkgname-$pkgver-$arch.tgz::https://github.com/perkeep/perkeep/releases/download/v$pkgver/perkeep-linux-amd64.tar.gz")
sha256sums_x86_64=('548c4d490c1ca3d65fef84a16c9c03b43f6a8bd8a33a8fea75d018d9b1510bf4')

package() {
  install -Dm755 -t "$pkgdir"/usr/bin/ perkeepd pk pk-get pk-mount pk-put
}
