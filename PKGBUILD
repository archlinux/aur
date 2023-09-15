# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.3.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')

source_x86_64=("${prjname}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")
source_i686=("${prjname}-${pkgver}-i686.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_i386.deb")
source_aarch64=("${prjname}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_arm64.deb")
source_armv7h=("${prjname}-${pkgver}-armv7h.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_armhf.deb")

sha512sums_x86_64=('9d2b8a36460e2fdbcfbc46a907161bd56617be4b96c63067b99dd01a6e9e2e0d6ea2c68c492810f0550332f754e9fbccca0b9a8b97cc0594739a38393c37ad7e')
sha512sums_i686=('85142f26bbc91ef8c7ad30897d18648b2cfa3c729c7db2ddf640750e7ac2bd89398cf251a56e136c26c911f8ba279a19e243188c0eca696a5fb65623fbb41009')
sha512sums_aarch64=('64604c7a7aaf792c0ca7a2235ef34d968541c7548e3e5264be999dab5ad48de221db1242fc30bc482c02a19941a6688d8a9f464d89fea04c4196072c2c76ca8e')
sha512sums_armv7h=('b5bdf12caa254db904b991aa9e371474d0f8a8acfb0552e3244e4406cbf525accc54d284ad22f0d3b060d7589e3429ba180e8e48c129ee55f7166a5b637cdd20')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
