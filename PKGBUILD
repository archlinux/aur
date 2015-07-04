# Maintainer: Michael Duell <michael.duell@rub.de> PGP-Fingerprint: FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77

pkgname=ttf-roboto
epoch=3
pkgver=20140702
pkgrel=3
pkgdesc="Google's Android 5 system font."
arch=('any')
license=('Apache')
url="http://www.google.com/design/spec/style/typography.html#typography-roboto"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=$pkgname.install
source=(
  "RobotoTTF-$pkgver-$pkgrel.zip::http://material-design.storage.googleapis.com/publish/v_2/material_ext_publish/0B08MbvYZK1iNZGNoWmJqVEhQYTQ/RobotoTTF.zip"
)
package()
{
  cd $srcdir

  install -d $pkgdir/usr/share/fonts/TTF/ 
  install -m644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF/ 
}

sha384sums=('f9d2e69bc5ea4f91d8f30f822e67d4554a4e113936cab2fe8f21b8ed293cfc1cc6d9dc617b22f61be3377e2aaeb3b95d')
