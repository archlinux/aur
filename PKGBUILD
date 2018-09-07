# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=marwaita-icon-theme
pkgver=1.0
pkgrel=1
pkgdesc="Marwaita icons for ArchLinux"
arch=('any')
url='https://www.gnome-look.org/p/1258318/'
license=('custom')
source=(marwaita-icon-theme.zip::"https://www.gnome-look.org/p/1258318/startdownload?file_id=1536162797&file_name=Marwaita%20Icons.zip&file_type=application/zip&file_size=27116753&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownload%2Fid%2F1536162797%2Fs%2Fb535f2ab6cd4264bd0eef2037b72f3fd%2Ft%2F1536311091%2Fu%2F%2FMarwaita%20Icons.zip")
md5sums=('567d8713accf326b4a389643896144e8')

package() {
    cd ${srcdir}
    install -dm 755 ${pkgdir}/usr/share/icons
    cp -avr * ${pkgdir}/usr/share/icons/
}
