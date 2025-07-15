#Maintainer: Enceka <enceka at yeah dot net>
pkgname=kbd-jp-oadg109a-keymap
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Added missing Japanese OADG109A layout (e.g. dell's travel keyboard japanese version)"
arch=(any)
url="http://example.com/dummy-url/"
license=('MIT')
depends=('kbd')
source=(jp-OADG109A.map.gz)
noextract=(jp-OADG109A.map.gz)

check() {
  return 0
}

package() {
  cd $srcdir
  install -D -m644 jp-OADG109A.map.gz ${pkgdir}/usr/share/kbd/keymaps/i386/qwerty/jp-OADG109A.map.gz
}

md5sums=('1229da10217dd350280fa89c69683c3d')
