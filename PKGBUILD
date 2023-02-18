# Maintainers: TheConfuZzledDude, swyter, M0Rf30

pkgname=jflap-beta
pkgver=7.1
pkgrel=4
pkgdesc="Software for learning the basic concepts of Formal Languages and Automata Theory, latest version with custom SVG icon and GTK theming."
arch=('any')
url="https://jflap.org/jflaptmp/"
license=('CCPL')
# conflicts=('')
depends=('java-runtime')
install=jflap.install

# swy: there's also the less complete (and older, from 2015) v8.0 version:
#      http://www.jflap.org/jflaptmp/jan24-15/JFLAP8_beta.jar
source=("https://jflap.org/jflaptmp/july27-18/JFLAP${pkgver}.jar"
        'jflap-beta.sh' 'jflap-beta.desktop' 'swyter-jflap-icon.svg')
noextract=('JFLAP7.1.jar, JFLAP.jar')

package()
{
  #cd $srcdir
  install -Dm 644 "JFLAP${pkgver}.jar"    "$pkgdir/opt/jflap-beta/JFLAP.jar"
  install -Dm 755 'jflap-beta.sh'         "$pkgdir/usr/bin/jflap-beta"
  install -Dm 755 'jflap-beta.desktop'    "$pkgdir/usr/share/applications/jflap-beta.desktop"
  install -Dm 644 'swyter-jflap-icon.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/swyter-jflap-icon.svg"
}
md5sums=('25a862c1dd2f07ffdb0ad602ab3ae2a0'
         '2fc85ec1b403128a6e806ee42ecd3f51'
         '6e3534e28f17b79f99e59afca71bc29c'
         '6925236e7c32342045a7ad1b31984cfb')
