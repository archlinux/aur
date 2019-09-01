# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>

pkgdesc='Utilities for building Arch packages for ROS stacks.'
url="https://github.com/ros-melodic-arch/ros-build-tools-py3"

pkgname='ros-build-tools-py3'
pkgver='0.3.0'
arch=('any')
pkgrel=1
license=('BSD')
makedepends=()
optdepends=('python3' 'python-argparse' 'python-yaml' 'python-termcolor' 'python-certifi')
depends=('bash')
provides=('ros-build-tools')
conflicts=('ros-build-tools')

pkg_destination_dir="/usr/share/ros-build-tools"

source=('fix-python-scripts.sh'
        'clear-ros-env.sh'
        'create_pkgbuild.py')

build() {
  return 0
}

package() {
  mkdir -p ${pkgdir}${pkg_destination_dir}
  for file in "${source[@]}"; do
    cp $file ${pkgdir}${pkg_destination_dir}/$file
  done
}

sha256sums=()
