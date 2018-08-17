# Maintainer: liberodark

pkgname=sftp-client
pkgver=3.0.17
pkgrel=1
pkgdesc="FTP / SFTP / SSH client build in electron."
arch=('x86_64')
url="https://www.sftpclient.io"
license=('Custom')
depends=('xdg-utils')
source_x86_64=("https://github.com/liberodark/sFTP-Client/releases/download/${pkgver}/sFTP-Client.deb")
sha512sums_x86_64=('9ebec0bbe2becdb72494c7e8cfcf8209e631cb63326109705f2da83deee7eec53da2aadde8e970c9f2f1e8a96c463172514cf79d8789594eb8fd010a1015a88a')
        
package() {
  cd $srcdir
  tar xvf data.tar.xz
  cp -r usr $pkgdir
}

