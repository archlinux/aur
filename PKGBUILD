# Maintainer: Olivier Michaelis <michaelis.olivier [at] gmail [dot] com>

pkgname=eks-node-viewer-bin
pkgver=0.5.0 # renovate: datasource=github-releases depName=awslabs/eks-node-viewer
pkgrel=1
pkgdesc="A tool to visualize dynamic node usage within an AWS EKS Kubernetes cluster"
arch=('x86_64')
url="https://github.com/awslabs/eks-node-viewer"
license=('Apache')
depends=('glibc')

source_x86_64=("eks-node-viewer-${pkgver}-x86_64::https://github.com/awslabs/eks-node-viewer/releases/download/v${pkgver}/eks-node-viewer_Linux_x86_64")

sha256sums_x86_64=('4312d5f4ee9aed184466f9268824e167729eef6d8c9e9c2e346d3ed6e49e69de')

package() {
    install -Dm755 eks-node-viewer-${pkgver}-${arch} "${pkgdir}/usr/bin/eks-node-viewer"
}
