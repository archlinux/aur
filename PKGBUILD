# Maintainer: omarplayz <omarplayzsounds@gmail.com>
pkgname=deta-surf
pkgver=1.1.0_beta.1.x86
pkgdesc="Deta Surf, an AI notebook that brings all your files and the web directly into your stream of thought."
pkgrel=2
arch=('x86_64')
source="git+https://github.com/deta/surf"
url="https://deta.surf"
license=('Apache-2.0')
depends=(glibc)
source=('deta-surf-1.1.0_beta.1.x86.AppImage::https://assets.deta.surf/releases/256375311/linux-x64/download')
sha256sums=('c7ae8f53f916bf00a52fbff159f2b7b74d77172a7457455060e69e4d44b9f8d5')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mv "$srcdir"/deta-surf-*.AppImage "$pkgdir/usr/bin/deta-surf"
    chmod +x "$pkgdir/usr/bin/deta-surf"

    echo
    echo "#############################################################"
    echo "#                                                           #"
    echo "#                     Hello there!                          #"
    echo "#                                                           #"
    echo "#  There is a notice, and that is when you try and search   #"
    echo "#  for the Deta Surf desktop icon.                          #"
    echo "#                                                           #"
    echo "#  Currently, we're now on a process of thinking and        #"
    echo "#  making one.                                              #"
    echo "#  I know, you know, everyone else knows,                   #"
    echo "#  but with a little bit of patience (and updates),         #"
    echo "#  you'll see it!                                           #"
    echo "#                                                           #"
    echo "#  As we say, thank you for reading this! (the note will    #"
    echo "#  be removed after adding the .desktop file.)              #"
    echo "#                                                           #"
    echo "#############################################################"
    echo
}

