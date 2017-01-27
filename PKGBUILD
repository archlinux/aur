# Maintainer: Ingo Bürk <admin at airblader dot de>
pkgname=yaxg-git
pkgver=latest
pkgrel=1
pkgdesc="Yet Another X Grabber"
arch=('i686' 'x86_64')
url="https://github.com/DanielFGray/yaxg"
license=('GNU')
#depends=()
optdepends=('slop: for selecting regions and windows'
            'maim: for saving screenshots'
            'ffmpeg: for recording videos'
            'byzanz: for recording gifs'
            'libnotify: for notifications')
makedepends=('git')
provides=('yaxg')
#conflicts=()
#groups=()
source=("$pkgname::git+https://github.com/DanielFGray/yaxg.git")
md5sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/${pkgname}/yaxg" "${pkgdir}/usr/bin/yaxg"
}
