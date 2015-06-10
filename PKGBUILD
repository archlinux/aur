# Maintainers: swyter, M0Rf30

pkgname=jflap-beta
pkgver=7.0
pkgrel=2
pkgdesc="Software to learning the basic concepts of Formal Languages and Automata Theory, latest version"
arch=('any')
url="http://www.jflap.org/"
license=('CCPL')
conflicts=('j_flap')
depends=('java-runtime')
install=jflap.install

# there's also the less complete v8.0 version: http://www.jflap.org/jflaptmp/jan24-15/JFLAP8_beta.jar
source=('http://www.jflap.org/jflaptmp/may15-2011/withoutSource/JFLAP.jar'
        'jflap.sh' 'jflap.desktop' 'swyter-jflap-icon.svg')
noextract=('JFLAP.jar')

package()
{
  #cd $srcdir
  install -Dm 644 'JFLAP.jar'             "$pkgdir/opt/jflap/JFLAP.jar"
  install -Dm 755 'jflap.sh'              "$pkgdir/usr/bin/jflap"
  install -Dm 755 'jflap.desktop'         "$pkgdir/usr/share/applications/jflap.desktop"
  install -Dm 644 'swyter-jflap-icon.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/swyter-jflap-icon.svg"
}
md5sums=('95d5f8f9f098331f6f61c24f7931589f'
         '6ce7e5c80d16fdc9d4f04089b50a0e96'
         '0fd855a18bacaac9f88cdec60597e90e'
         '6925236e7c32342045a7ad1b31984cfb')
