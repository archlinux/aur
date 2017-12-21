# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The service command for ROS 2 command line tools."
url='http://www.ros.org/'

pkgname='ros-ardent-ros2service'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-ros2srv
  ros-ardent-rclpy
  ros-ardent-ros2topic
  ros-ardent-ros2cli)
depends=(${ros_depends[@]}
  python-yaml)

# Git version (e.g. for debugging)
# _tag=release/ardent/ros2service/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ros2cli-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros2cli-release-release-ardent-ros2service-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ros2cli-release/archive/release/ardent/ros2service/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('780a5f93c250bd2b9341f636d49c64ddb661af5083bd10a2cbc75aab0d4e5f6f')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}
