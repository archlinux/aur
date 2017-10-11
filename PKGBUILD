# Maintainer: Reza Farrahi M <imriss@yahoo.com>

pkgname=kubernetes-built
pkgnameorg=kubernetes
pkgver=1.8.0
pkgrel=1
pkgdesc="Production-Grade Container Scheduling and Management - binary version of aur-kubernetes"
arch=('any')
url="http://kubernetes.io/"
license=("APACHE")
backup=('etc/kubernetes/apiserver'
        'etc/kubernetes/config'
        'etc/kubernetes/controller-manager'
        'etc/kubernetes/kubelet'
        'etc/kubernetes/proxy'
        'etc/kubernetes/scheduler')
provides=('kubernetes')
conflicts=('kubernetes' 'kubernetes-bin')
depends=('go' 'go-bindata' 'docker' 'ebtables' 'ethtool')
source=("https://versaweb.dl.sourceforge.net/project/aur-kubernetes-built/kubernetes-$pkgver-$pkgrel-x86_64.pkg.tar.xz"
		)
noextract=("kubernetes-$pkgver-$pkgrel-x86_64.pkg.tar.xz")
sha256sums=('5409e19ce8d461e4d27253320f1b00be361a80f50ddcb7e424f4f5eb3bb566a0')
md5sums=('8482913f2937d9925763c09f206ff1e3')

