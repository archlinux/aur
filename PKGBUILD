# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
prjname=pot
pkgver=0.0.5
pkgrel=0
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64')
url="https://github.com/Pylogmon/pot"
license=('GPL3')
depends=('libappindicator-gtk3' 'webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xsel')

source=("${prjname}-${pkgver}-${arch}.deb::https://github.com/Pylogmon/pot/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")

sha512sums=('1460d2aab7616ef0cdf431f119ab30d2047828dea582ff7a22661eca0ed543e294882e7c598242be9c0e6ca592d6063c948cc3e6a075892cdad59a4269b4349e')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
