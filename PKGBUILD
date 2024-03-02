# Maintainer: Pavel Kuzminov <neko@pavel.gg>
# Contributor: Jordan Klassen <jordan@klassen.me.uk>
pkgname='teamspeak3-addon-installer'
pkgver=0.2
pkgrel=1
pkgdesc='Simple script to install packages from Teamspeak 3'\''s addon site. Automatically creates packages for the teamspeak directory'
arch=('any')
url='https://github.com/Nekoavel/teamspeak3-addon-installer'
license=('WTFPL')
depends=('bash' 'teamspeak3')
source=('teamspeak3-install-addon' 'WTFPL')
sha256sums=('41662e057318496023a0f59f02b420d65a7e988bc0e2bba017eadfc007823b93'
            'c843583b8a523b4172e54b53721e09d0d852d82e9a548e46fa15b8adb0edce27')

package() {
  mkdir -p -- "$pkgdir/usr/bin"
  cp "teamspeak3-install-addon" "$pkgdir/usr/bin/teamspeak3-install-addon"
  chmod +x /usr/bin/teamspeak3-install-addon
  install -Dm644 ./WTFPL "$pkgdir/usr/share/licenses/$pkgname/WTFPL"
}
