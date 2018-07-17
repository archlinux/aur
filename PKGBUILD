
# Maintainer: excalibur1234 @forum.manjaro.org


pkgname=pacui
pkgver=1.11
pkgrel=1
pkgdesc="Bash script providing advanced Pacman and Yay/Pikaur/Aurman/Pakku/Trizen/Pacaur functionality in a simple UI"
arch=(any)
url="https://github.com/excalibur1234/$pkgname"
license=('GPL3')
depends=('pacman-contrib' 'expac' 'wget' 'sudo' 'fzf')


conflicts=("$pkgname-git")
optdepends=('yay: One AUR helper is needed for AUR support.'
            'pikaur: One AUR helper is needed for AUR support.'
            'aurman: One AUR helper is needed for AUR support.'
            'pakku: One AUR helper is needed for AUR support.'
            'trizen: One AUR helper is needed for AUR support.'
            'pacaur: One AUR helper is needed for AUR support.'
            'pacman-mirrors: Needed for Manjaro mirror support'
            'pacman-mirrors: Needed for Manjaro mirror support'
            'reflector: Needed for Arch Linux mirror support'
            'downgrade: Needed for hidden "downgrade" option.')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('13d43a8312e954a5bf3e3aa331be18af')

# how to update md5sum:
#  1. do "updpkgsums" inside the folder with PKGBUILD file
#  2. delete .tar.gz file


package () {
            install -Dm755 "$srcdir/$pkgname-$pkgver/pacui" "$pkgdir/usr/bin/pacui"
}
