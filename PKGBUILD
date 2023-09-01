# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
_pkgver=2.0.0-beta.0
pkgver=2.0.0.beta.0
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')

source_x86_64=("${prjname}-${_pkgver}-x86_64.deb::${url}/releases/download/${_pkgver}/${prjname}_${_pkgver}_amd64.deb")
source_i686=("${prjname}-${_pkgver}-i686.deb::${url}/releases/download/${_pkgver}/${prjname}_${_pkgver}_i386.deb")
source_aarch64=("${prjname}-${_pkgver}-aarch64.deb::${url}/releases/download/${_pkgver}/${prjname}_${_pkgver}_arm64.deb")
source_armv7h=("${prjname}-${_pkgver}-armv7h.deb::${url}/releases/download/${_pkgver}/${prjname}_${_pkgver}_armhf.deb")

sha512sums_x86_64=('f52b9177e7bf8ea4d48fc444b5b4409e34393411570d22df583250db35e7ceb9cc3e1b0201d154c310d1cd025677a8488e4b7dc845bdcbdf5dcd8e10148af130')
sha512sums_i686=('3b62b83174a0916b291925f707f9e16bd2f43fb9d783d259aba96f81ac9fddaf89899b998cfb2b96d32c64357542a0d01fd1b442bd75897cfc4218663af9482f')
sha512sums_aarch64=('01fa8e0e857b61e319d73f40686bfe62f7080fd73503d26545b98d528a99ed813a10b2ddcd8cae80b0eada0e2c0b53551439a768b11d886997e8ce9fe064586d')
sha512sums_armv7h=('c96b66106edf7b918217850d094632431ef3a15014b3865f1c1dc0213370f197c01250dee6178c9a399d02d5ef98bf5cb170d8179eb9736040ebf7c52e8d9ba9')

pkgver() {
    printf "%s" "$(echo $_pkgver | sed 's/-/\./g')"
}

package() {
    tar xpf data.tar.gz -C ${pkgdir}
}
