# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The parser for the manifest files in the ament buildsystem."
url='http://www.ros.org/'

pkgname='ros-ardent-ament-package'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]}
  python-pyparsing
  python-setuptools)

# Git version (e.g. for debugging)
# _tag=release/ardent/ament_package/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ament_package-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ament_package-release-release-ardent-ament_package-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ament_package-release/archive/release/ardent/ament_package/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('2180cff34c1e6f218e90b5e7e137eefc65403469ed4ffe5147e516223480c457')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}
