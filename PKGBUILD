# Maintainer: Jack Chen <redchenjs@live.com>

pkgname=adobe-source-han-sans-classic-fonts
pkgver=2.002
_commit=f0d19d47b12ae57589d6dbc6bcb3c832a20972dd
pkgrel=1
pkgdesc='Adobe Source Han Sans fonts with classic orthography.'
arch=('any')
url="https://github.com/redchenjs/source-han-sans-classic"
license=('custom:OFL')
source=("https://github.com/redchenjs/source-han-sans-classic/archive/$_commit/source-han-sans-classic-$_commit.tar.gz")
sha512sums=('81264d58c38bb80b52bef677c378e2f0d9056eff5320ef81ec5e0337ca237face2031b0ff620451df1004557cf27c0cc40c7938a42b6093ed0a2427758181c89')

package() {
  cd "source-han-sans-classic-$_commit"

  mkdir -p "$pkgdir/usr/share/fonts/adobe-source-han-sans"
  install -Dm644 *.otf "$pkgdir/usr/share/fonts/adobe-source-han-sans/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
