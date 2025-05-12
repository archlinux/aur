# Maintainer: Çınar Kuzey KUMANLI <root_4rch@proton.me>
pkgname=yaud
pkgver=1.0.0
pkgrel=1
pkgdesc="YAUD: Yet Another User Defender , an app that defend users from dangerous commands."
arch=('x86_64')
url="https://github.com/npc-gnu/yaud"
license=('GNU General Public Lisence v3')
depends=('bash' 'coreutils') 
source=("https://github.com/npc-gnu/yaud/raw/main/yaud_bin/yaud_bin.tar.gz") 
sha256sums=('SKIP') 

package() {
  cd "$srcdir"
  install -Dm755 yaud "$pkgdir/usr/local/bin/" 
}

