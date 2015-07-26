# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=justbrowsing-theme
pkgver=1.0
pkgrel=3
pkgdesc="Icons, font and wallpapers for JustBrowsing"
arch=('any')
url="https://github.com/justbrowsing/justbrowsing-theme"
license=('GPL2' 'CCPL')
depends=('clearlooks-phenix-gtk-theme' 'cantarell-fonts')
makedepends=('')
optdepends=('justbrowsing-home: Creates user for JustBrowsing' 
            'justbrowsing-adeskbar: Panel for JustBrowsing')
provides=('justbrowsing-theme' 'gnome-themes-standard')
conflicts=('gnome-colors-icon-theme')
source=("https://github.com/justbrowsing/justbrowsing-theme/archive/master.tar.gz")
md5sums=('2c92ea358489f8f960215b73ea39013a')

package() {
  cd "${srcdir}/justbrowsing-theme-master"  

  # Icon sets
  mkdir -p "$pkgdir/usr/share/icons"
  cp -a gnome-brave "$pkgdir/usr/share/icons"
  cp -a gnome-colors-common "$pkgdir/usr/share/icons"
  cp -a justbrowsing "$pkgdir/usr/share/icons"
  
  # Font
  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  cp -a jb-digital.ttf "$pkgdir/usr/share/fonts/TTF"

  # Backgrounds
  mkdir -p "$pkgdir/usr/share/backgrounds/justbrowsing"
  cp -a lockscreen "$pkgdir/usr/share/backgrounds/justbrowsing"
  cp -a wallpaper "$pkgdir/usr/share/backgrounds/justbrowsing"
}

