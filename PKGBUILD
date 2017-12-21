# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Python nodes which were previously in the ros2/examples repository but are now just used for demo purposes."
url='http://www.ros.org/'

pkgname='ros-ardent-demo-nodes-py'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-example-interfaces
  ros-ardent-std-msgs
  ros-ardent-rclpy)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/demo_nodes_py/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/demos-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="demos-release-release-ardent-demo_nodes_py-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/demos-release/archive/release/ardent/demo_nodes_py/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('6958254df412fc96892684177e2511896f4c6ae9b395327b4fda96ae09554ece')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}
