# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=softethervpn-client-manager
pkgver=v4.20_9608
pkgrel=1
pkgdesc="SoftEther VPN Client Manager"
arch=('i686' 'x86_64')
url="https://www.softether.org/"
license=('GPL')
depends=('desktop-file-utils' 'wine')
install="vpncmgr.install"
source=('file://hamcore.se2'
        'file://vpncmgr.exe'
        'vpncmgr.desktop'
        'vpncmgr.png'
        'vpncmgr.sh'
        'vpncmgr-remote.desktop'
        'vpncmgr-remote.sh')
md5sums=('0713e1667e06f7f181aaa9bfee7a4dc7'
         'd6e42a7d8d2a4d61e4dc08748960c542'
         '98c8ca04d44309eb6902e6db718a78e3'
         '2700860e1d40d685894aa88b0e0d42f1'
         '72769397b0ca79ff92de136dbf8ec7ad'
         '4f7f7176fc26843a9eb6e722ecd3ff88'
         '572d8e51348aa8e3a4b1402c4ebc82dc')

package() {
  install -D -m 755 vpncmgr.sh "${pkgdir}/usr/bin/vpncmgr"
  install -D -m 755 vpncmgr-remote.sh "${pkgdir}/usr/bin/vpncmgr-remote"
  install -D -m 644 hamcore.se2 "${pkgdir}/usr/lib/softethervpn/vpncmgr/hamcore.se2"
  install -D -m 644 vpncmgr.exe "${pkgdir}/usr/lib/softethervpn/vpncmgr/vpncmgr.exe"
  install -D -m 644 vpncmgr.desktop "${pkgdir}/usr/share/applications/vpncmgr.desktop"
  install -D -m 644 vpncmgr-remote.desktop "${pkgdir}/usr/share/applications/vpncmgr-remote.desktop"
  install -D -m 644 vpncmgr.png "${pkgdir}/usr/share/pixmaps/vpncmgr.png"
}

# vim:set ts=2 sw=2 et:
