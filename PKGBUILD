pkgname=phraseapp-client
pkgver=1.4.5
pkgrel=1
pkgdesc="PhraseApp CLI tool"
arch=('i686' 'x86_64')
url="https://phraseapp.com/cli"
license=('MIT')

source_i686=('https://github.com/phrase/phraseapp-client/releases/download/1.4.5/phraseapp_linux_386.tar.gz')
source_x86_64=('https://github.com/phrase/phraseapp-client/releases/download/1.4.5/phraseapp_linux_amd64.tar.gz')

sha256sums_i686=('7e69dcf9e24fc9c7e64ffbb201d991a7f3ba9a840125ab334b0c0dc86cc2c554')
sha256sums_x86_64=('6fa4463fc74e602ccc3b93c25038aedf7cbdb8e7afa2997a3629d6678f959cf1')

package() {
  if [ $CARCH == 'i686' ]; then
    install -Dm0755 "$srcdir/phraseapp_linux_386" "$pkgdir/usr/bin/phraseapp"
  else
    install -Dm0755 "$srcdir/phraseapp_linux_amd64" "$pkgdir/usr/bin/phraseapp"
  fi
}
