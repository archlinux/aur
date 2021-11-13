#Maintainer weearc<qby19981121@gmail.com>
pkgname=fcitx5-simple-blue
_pkgname=fcitx5-skin-simple-blue
pkgver=v2
_commit=68f2cfc1dcd3ad6d335fa9275f39abe0c4d4c870
pkgrel=1
pkgdesc="Theme for fcitx5."
arch=('any')
url="https://github.com/weearc/fcitx5-skin-simple-blue"
license=('Unlicense')
source=("$url/archive/$_commit/$pkgname-$_commit.tar.gz")
sha256sums=("6ba40b6854583bb0041bf945e3d887deef37b74fc07b0e4539d6645b1bac5a1e")
package() {
  install -d ${pkgdir}/usr/share/fcitx5/themes 
  cd ${srcdir}
  
  install -Dm644 $_pkgname-$_commit/UNLICENSE ${pkgdir}/usr/share/licenses/$pkgname/UNLICENSE
  mv $_pkgname-$_commit  ${pkgdir}/usr/share/fcitx5/themes/$pkgname

}

