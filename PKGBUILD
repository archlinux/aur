# Maintainer: Çınar Kuzey KUMANLI <root_4rch@proton.me>
pkgname=yaud
pkgver=1.0.0
pkgrel=1
pkgdesc="YAUD: Yet Another User Defender , an app that defend users from dangerous commands."
arch=('x86_64')
url="https://github.com/npc-gnu/yaud"
license=('GNU General Public Lisence v3')
depends=('bash' 'coreutils') 
source=("https://github.com/npc-gnu/yaud/blob/main/yaud_bin/yaud-bin.tar.gz") 
sha256sums=('fd4ac236a7ad5a12f89e02026124f54d0c188b073238cb73690c22cadec5743f') 

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 yaud "$pkgdir/usr/local/bin/yaud" 
}

