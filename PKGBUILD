# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>

pkgname=ttf-akashi
pkgver=3
pkgrel=1
pkgdesc="Akashi is a simplified font with a futuristic touch. Angled cut aways lend the shapes a sharper"
arch=('any')
license=('custom')
url="http://tenbytwenty.com/?xxxx_posts=akashi"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("http://tenbytwenty.com/wp-content/uploads/2013/03/akashi1.zip"
        "LICENSE")

md5sums=('ca2e4a7cda88d13125e9925efa678540'
         '95ac5ed4027706b1cf6e1a7667c31bb4')

package() {
  cd $srcdir
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ || return 1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
