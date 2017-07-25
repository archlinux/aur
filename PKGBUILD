# Maintainer: helix <stargr@gmail.com>
pkgname=subedit
pkgver=1.01
pkgrel=2
pkgdesc='Subtitle editor written in bash'
arch=('any')
license=('GPL2')
depends=('bash' 'dos2unix' 'uchardet')
url="https://github.com/helixarch/subedit"
source=("$pkgname-$pkgver.tar.gz::https://github.com/helixarch/subedit/archive/$pkgver.tar.gz"
        "subedit.install")

sha512sums=('064343660830d94b2d6eed1937ff3e53f4abda39bf1a6b73648380e5685523d682c5740aed3d43dd83e8d409157dbbc1f5e9690720ab9eac6a739647babda243'
            'cb9ff39ade9dd0a408bd5fb21cb00ad1c4382790e20f1656961b56bc9adb61cd6cbe9c668239389f2fa469433defc22da83dfefcf89062015ea38e0f2391918a')

install=subedit.install

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 subedit "$pkgdir/usr/bin/subedit"
  install -Dm6s44 subeditrc "$pkgdir/etc/subeditrc"
}
