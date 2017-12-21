# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Framework for ROS 2 command line tools."
url='http://www.ros.org/'

pkgname='ros-ardent-ros2cli'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-rclpy)
depends=(${ros_depends[@]}
  python-setuptools)

# Git version (e.g. for debugging)
# _tag=release/ardent/ros2cli/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ros2cli-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros2cli-release-release-ardent-ros2cli-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ros2cli-release/archive/release/ardent/ros2cli/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('edf8167db467ec6638b4a62d602fdfe508593de0f5ba399ea0b67860b56fe2a9')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}
