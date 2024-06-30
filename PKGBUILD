# Maintainer: Ivan <ivanmaisky123@gmail.com>
pkgname='zerotier-one-openrc'
pkgver=1.0
pkgrel=1
pkgdesc='OpenRC service for ZeroTier-One'
arch=('any')
url='https://github.com/zerotier/ZeroTierOne'
license=('GPL3')
depends=('zerotier-one' 'openrc')
source=('zerotier-one')
b2sums=('29a323f2397cc20656b92ff7c2f5980045c41d6a6b78b7defc9a22de9cc4a47a4b65b44300afbfbf2227db7732c868b89103ab2202318ccfbb5b159808f7e0e9')

package() {
    install -Dm755 'zerotier-one' "${pkgdir}/etc/init.d/zerotier-one"
}
