# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=hugo-extended
pkgver=0.83.1
pkgrel=1
pkgdesc="Hugo is one of the most popular open-source static site generators. With its amazing speed and flexibility, Hugo makes building websites fun again."
arch=('x86_64')
url="https://gohugo.io/"
license=('Apache v2.0')
conflicts=('hugo' 'hugo-git')
source=("https://github.com/gohugoio/hugo/releases/download/v${pkgver}/hugo_extended_${pkgver}_Linux-64bit.tar.gz")
sha256sums=("7dab678e7bd47de76b311c1dc51257d1ba41d95e8e1d30869f701e1628261447")

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/hugo"

    cp -avr "hugo" "${pkgdir}/opt/hugo"
    cp -avr "LICENSE" "${pkgdir}/opt/hugo"
    cp -avr "README.md" "${pkgdir}/opt/hugo"
    
    ln -sv "/opt/hugo/hugo" "${pkgdir}/usr/bin/hugo"
}
