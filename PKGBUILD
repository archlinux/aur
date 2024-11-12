# Maintainer: snemc snemc @3112671039@qq.com

pkgname=umi-ocr
_pkgname=${pkgname%-bin}
pkgrel=1
pkgver=2.1.4
pkgdesc="免费，开源，可批量的离线OCR软件 Free, open source, batch-capable offline OCR software, Free, open source, offline OCR software that can batch"
arch=('x86_64')
url="https://github.com/hiroi-sora/Umi-OCR"
license=('MIT')
depends=()
makedepends=(bash tar)

_srcfilename_x86_64="Umi-OCR_Linux_Paddle_${pkgver}.tar.xz"


source=("umi-ocr.desktop")
source=("${_srcfilename_x86_64}::https://github.com/hiroi-sora/Umi-OCR/releases/download/v2.1.4/Umi-OCR_Linux_Paddle_${pkgver}.tar.xz")

sha256sums=('0dae3a93eb4fc8da23097944f403d143430ec27a91ce3fa563ac5d363b69246e')


package() {

  cp -r "${srcdir}/$(_pkg)"  ~/.local/share/

}
