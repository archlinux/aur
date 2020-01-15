# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-youtube-sm-parser
pkgver=0.1.5
pkgrel=1
pkgdesc="Output youtube subscriptions using subscription_manager file"
arch=('any')
url="https://github.com/shanedabes/youtube_sm_parser"
license=('APACHE')
depends=('python' 'python-xmltodict' 'python-requests-futures')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shanedabes/youtube_sm_parser/archive/${pkgver}.tar.gz")
sha256sums=('562e4110c8f26dc375ec26bff11a73628f7924957f3c3326957b082c23b3d881')

package() {
    cd "youtube_sm_parser-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
