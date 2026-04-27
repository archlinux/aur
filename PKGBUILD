# Maintainer: bloxxel64colonthree @ discord
pkgname=mari0-ae-bin
pkgver=13.2
pkgrel=1
pkgdesc="A mod/continuation of the original Mari0 with more objects and features, considered the definitive version." 
arch=('x86_64')
url='https://github.com/alesan99/mari0_ae'
license=('WTFPL')
source=("${pkgname}-${pkgver}.zip::https://www.dropbox.com/scl/fi/1zrtqil96p54pjzlmk0le/alesan99s_entities_13.2-linux.zip?rlkey=8phtksssm1nzuxiebklekt9ep&st=asjr4v3j&dl=1")
sha256sums=(38bda444c339e6f199519a70b9484c962f40e1e9e8eb07bace285d4fac975f45)

depends=('love>=11.5')

package(){
    ./mari0_ae.AppImage --appimage-extract
    install -Dm755 "${srcdir}/squashfs-root/bin/love" "$pkgdir/usr/share/${pkgname}/${pkgname}"
}