# Contributor linuxer <linuxer@artixlinux.org>
# Copyright 2020 Dave Eddy <dave@daveeddy.com> (https://www.daveeddy.com)

pkgname=runit-service-manager
pkgalias=runit-service-manager
_realname=runit-service-manager
pkgdesc="runit service manager"
alias=runit-service-manager
pkgver=1.3.4
pkgrel=1
pkgbase=runit-service-manager
replaces=('runit-service-manager')
arch=('any')
url="https://gitea.artixlinux.org/linuxer/Runit-Service-Manager"
license=('MIT')
groups=()
depends=('runit')
source=("https://gitea.artixlinux.org/linuxer/Runit-Service-Manager/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
	echo "${srcdir}/${alias}-${pkgver}"
    cd "${srcdir}/${alias}"
    install -Dm 755 rsv -t "${pkgdir}/usr/bin/"
}
