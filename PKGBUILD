pkgname=('ttf-astra-sans' 'ttf-astra-serif')
pkgver=1001
pkgrel=2
pkgdesc="Free russian sans-serif fonts by Astra"
arch=(any)
depends=(fontconfig xorg-font-utils)
source=("http://astra-linux.su/images/fonts/PTAstraSans&Serif_TTF_ver${pkgver}.zip")
md5sums=('31b30481edf94b82ff33c4129e60e48a')
license=('OFL')
install=$pkgname.install

package_ttf-astra-sans() {
  install -Dm644 $srcdir/PTAstraSans-Bold.ttf "$pkgdir"/usr/share/fonts/TTF/AstraSans-Bold.ttf
  install -Dm644 $srcdir/PTAstraSans-BoldItalic.ttf "$pkgdir"/usr/share/fonts/TTF/AstraSans-BoldItalic.ttf
  install -Dm644 $srcdir/PTAstraSans-Italic.ttf "$pkgdir"/usr/share/fonts/TTF/AstraSans-Italic.ttf
  install -Dm644 $srcdir/PTAstraSans-Regular.ttf "$pkgdir"/usr/share/fonts/TTF/AstraSans-Regular.ttf
}

package_ttf-astra-serif() {
  install -Dm644 $srcdir/PTAstraSerif-Bold.ttf "$pkgdir"/usr/share/fonts/TTF/AstraSerif-Bold.ttf
  install -Dm644 $srcdir/PTAstraSerif-BoldItalic.ttf "$pkgdir"/usr/share/fonts/TTF/AstraSerif-BoldItalic.ttf
  install -Dm644 $srcdir/PTAstraSerif-Italic.ttf "$pkgdir"/usr/share/fonts/TTF/AstraSerif-Italic.ttf
  install -Dm644 $srcdir/PTAstraSerif-Regular.ttf "$pkgdir"/usr/share/fonts/TTF/AstraSerif-Regular.ttf
}
