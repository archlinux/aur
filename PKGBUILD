# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=terraform-provider-hcloud-snapshot
pkgver=1.9.0
pkgrel=1
pkgdesc="Terraform provider for Hetzner Cloud (snapshot)"
url="https://github.com/terraform-providers/terraform-provider-hcloud"
arch=("x86_64")
license=("MPL")
_gourl="github.com/terraform-providers"
source=("http://terraform-0.12.0-dev-snapshots.s3-website-us-west-2.amazonaws.com/terraform-provider-hcloud/1.9.0-dev20190216H01-dev/terraform-provider-hcloud_1.9.0-dev20190216H01-dev_linux_amd64.zip")
sha256sums=('cb8ea28bc1f47d97d89a917fbf8b41ce71a98c4aad016d0aaf6de9311461bafe')

package() {
    install -Dm755 ./terraform-provider-hcloud_v1.9.0-dev20190216H01-dev_x4 "$pkgdir/usr/bin/terraform-provider-hcloud"
}
