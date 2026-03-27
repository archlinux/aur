# Maintainer: hqppyz <marco@montanari.cc>

pkgname=open-webui-openrc
pkgver=1.0
pkgrel=1
pkgdesc="OpenRC service for Open WebUI"
arch=('any')
url='https://aur.archlinux.org/packages/open-webui-openrc'
license=('custom:WTFPL')
depends=('open-webui' 'openrc')
install="open-webui.install"
source=(
  'open-webui.initd'
  'open-webui.install'
  'LICENSE'
)
sha256sums=(
  '1afedb1f0da3849443fbbc874948b68531d5af8ab6a6837ec1c4f648fc10b130'
  '5b2b2d641b84c2c893a40e5a905485f60d6bbde4db71e361b9d5c1e388e71f6a'
  'c843583b8a523b4172e54b53721e09d0d852d82e9a548e46fa15b8adb0edce27'
)

package() {
  install -Dm755 "${srcdir}/open-webui.initd" "${pkgdir}/etc/init.d/open-webui"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}