# Maintainer: Jan Dvorak <(firstname).(lastname) @ dvorak-sw.com>
pkgname=nconvert-bin
_pkgname=nconvert
pkgver=7.192
pkgrel=1
epoch=
pkgdesc="Command line batch image processor and converter from XnSoft."
arch=('i686' 'x86_64')
url="https://www.xnview.com/en/nconvert/"
license=('custom')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_i686=('https://download.xnview.com/NConvert-linux.tgz')
source_x86_64=('https://download.xnview.com/NConvert-linux64.tgz')
sha256sums_i686=('5e8364bdc1fe61d2c37871e0591ddc2048ccf0cd8041846b433ef04f10280cba')
sha256sums_x86_64=('048c3c298acab62e05ad606f9a692748ff095f9034465932557da41f76b6827a')
package() {
        cd NConvert
        install -m 755 -D nconvert "${pkgdir}/usr/bin/nconvert"
        install -m 644 -D license.txt "${pkgdir}/usr/share/licenses/${_pkgname}/license.txt"
        install -m 644 -D -t "${pkgdir}/usr/share/doc/${_pkgname}" Formats.txt Plugins.txt ReadMe.txt Usage.txt WhatsNew.txt
}
