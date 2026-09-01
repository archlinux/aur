# Maintainer: clansty

pkgname=lunacy-thumbnailer
pkgver=1.0.0
pkgrel=1
pkgdesc='Nautilus thumbnailer for Lunacy documents'
arch=('any')
url='https://icons8.com/lunacy'
license=('MIT')
depends=('imagemagick' 'libarchive')
source=('lunacy-thumbnailer' 'lunacy.thumbnailer' 'LICENSE')
sha256sums=('39ca6775e7d93386836f625fcd00518cd9058c158e672dbebbc3f86a1fc0875f'
            'f17b64909dcdd448d5d710362ce7db8e128eeac5e575fa6bb2e602187b82d542'
            'bb79aa1d0cf79bf75421ee1174bc7d649cd2a5a56fdc08412e9a1b0311e3d7ef')

package() {
    install -Dm755 lunacy-thumbnailer "$pkgdir/usr/bin/lunacy-thumbnailer"
    install -Dm644 lunacy.thumbnailer \
        "$pkgdir/usr/share/thumbnailers/lunacy.thumbnailer"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
