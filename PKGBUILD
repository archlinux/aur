# Maintainer: jason ryan <jasonwryan at gmail dot com>
# Contributor: Ignas Anikevicius <anikevicius at gmail dot com>

pkgname=ttf-droid-monovar
pkgver=1.0
pkgrel=5
pkgdesc="A monospacedfont created by Ascender Corporation with dotted and slashed zeros."
url="http://www.cosmix.org/software/"
license=('apache')
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.cosmix.org/software/files/DroidSansMonoSlashed.zip'
'http://www.cosmix.org/software/files/DroidSansMonoDotted.zip')
install=ttf-droid-monovar.install
arch=('any')
md5sums=('4df780cb87f2931233123117feac5e2c'
         '76a1c759e328ac15fd0d33ee9a4b3723')
        
package() {
     cd "$srcdir"
       install -d -m755 "$pkgdir"/usr/share/fonts/TTF
       install -m 644 DroidSansMonoSlashed.ttf \
               "$pkgdir"/usr/share/fonts/TTF/DroidSansMonoSlashed.ttf
       install -m 644 DroidSansMonoDotted.ttf \
               "$pkgdir"/usr/share/fonts/TTF/DroidSansMonoDotted.ttf
}

