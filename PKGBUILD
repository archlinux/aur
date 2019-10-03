# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=ttf-noble-scarlet
pkgver=11.3.0
pkgrel=1
pkgdesc="Microsoft's new Chinese font in Windows Insider 17063"
arch=('any')
url="https://www.zhihu.com/question/67196637"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
source=("https://blog.deartanker.com/wp-content/uploads/win/NewMicrosoftYaHei.${pkgver}.zip")
md5sums=('aa1bf102e5e7a35f035996b78438f26a')

package() {
	install -d "${pkgdir}/usr/share/fonts/TTC"
	install -m644 "${srcdir}"/*/*.ttc "${pkgdir}/usr/share/fonts/TTC"
}
