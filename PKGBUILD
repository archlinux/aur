# Maintainer: Runnytu < runnytu at gmail dot com >
# OldMaintainer: FreeK <stephan@confidr.me>
# Contributor: olav-st <olav.s.th@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname=nomachine
pkgver=5.1.24
pkgrel_i686=1
pkgrel_x86_64=1
pkgrel_armv6h=2
pkgrel_armv6h=2
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
options=('!strip')
conflicts=('nxmanager nxwebplayer nxserver nxnode nxclient')
depends=('bash')
sha512sums_x86_64=('540aa74db143ff568312cd2b0c2a8756e5b7fd986f8eed47cc2f7c932331fff42530122f696780ed44e4a5145f51b61c909fadf3da6320dfa63a8505564ff6f2')
source_x86_64=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_x86_64}_x86_64.tar.gz")
sha512sums_i686=('11c554bc1862eaa86781a9b7e66a5e0749127b26e3e132eb4d0ae6ca39c315a62807026b4e44817717575476ad18fb8bf4ffe9f433876385fb356b34b02d69d5')
source_i686=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_i686}_i686.tar.gz")
sha512sums_armv6h=('1837d654429337b6b98ef7e04e5b3769815243621c550d23b1ae8cb98aff82d7f6d0fd2bdd7cfd79627c4c1a428cc9e1c618b05431d9a9713fee47b403c61c75')
source_armv6h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv6h}_armv6hl.tar.gz")
sha512sums_armv7h=('ebd485e74f754f239af4e279276a6d2bd536f4840a88a667c9e3f73bc1821bedfda86f52b8cee88db92b5e311c68c297881e46623aa35b42befb69fb6c80acdf')
source_armv7h=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${pkgrel_armv7h}_armv7hl.tar.gz")
install=nomachine.install

package()
{
  cd "$srcdir"
  mkdir "$srcdir/NX/etc" -p
  install -d "$pkgdir/usr/"
  cp -a NX "$pkgdir/usr/NX"
}

