# Maintainer: Gary van der Merwe <garyvdm@gmail.com>
pkgname=openshift-origin-source-to-image
pkgver=1.1.2
pkgver_git_sha=5732fdd
pkgrel=1
pkgdesc="OpenShift Source-to-Image (S2I) is a toolkit and workflow for building reproducible Docker images from source code."
arch=('i686' 'x86_64')
url="https://github.com/openshift/source-to-image"
license=('Apache')
source_x86_64=("https://github.com/openshift/source-to-image/releases/download/v$pkgver/source-to-image-v$pkgver-$pkgver_git_sha-linux-amd64.tar.gz")
source_i386=("https://github.com/openshift/source-to-image/releases/download/v$pkgver/source-to-image-v$pkgver-$pkgver_git_sha-linux-386.tar.gz")

md5sums_x86_64=("0821f29885ed7f677d59a5bd516be1db")
md5sums_i386=("80433ab13de4e0ecf1dff7adec85dcae")

package() {
	install -D s2i "$pkgdir/usr/bin/s2i"
}
