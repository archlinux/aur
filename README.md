# tensorflow-amd-git
This repository is the PKGBUILD, patches, and test scripts for building the `tensorflow-amd-git` and `python-tensorflow-amd-git` packages on Arch Linux.
Unlike the `tensorflow-rocm` series of packages, which pull from the official tensorflow/tensorflow repo,
this package pulls directly from [AMD's upstream fork.](https://github.com/ROCmSoftwarePlatform/tensorflow-upstream/)
Specifically, as of 2023-07-04 it draws on the "r2.12-rocm-enhanced" branch on the commit of [the last successful build.](http://ml-ci.amd.com:21096/job/tensorflow/job/release-rocmfork-r212-rocm-enhanced/job/release-build-whl/lastSuccessfulBuild/)
If that link is dead, you may be able to find an equivalent by following these breadcrumbs:
* [tensorflow/tensorflow](https://github.com/tensorflow/tensorflow/) ->
* [Community Supported TensorFlow Builds](https://github.com/tensorflow/build#community-supported-tensorflow-builds) ->
* [Linux AMD ROCm GPU Stable : TF 2.x 	Build Status 	Release 2.12](http://ml-ci.amd.com:21096/job/tensorflow/job/nightly-rocmfork-develop-upstream/job/nightly-build-whl/lastSuccessfulBuild/)

## Optional non-x86_64 optimizations
Tensorflow supports CPU instructions available on many Intel CPUs from 2013 or later which don't work on AMD CPUs.
To build with the haswell optimizations enabled, edit the PKBUILD:
```
#_build_no_opt=auto
#_build_opt=auto
_build_no_opt=0
_build_opt=1
```

## Build instructions
```
sudo pacman -S base-devel
git clone https://aur.archlinux.org/packages/tensorflow-amd-git
cd tensorflow-amd-git
python update_last_successful.py # Optional, uses requests and bs4 libraries
makepkg
sudo pacman -U tensorflow*.zst python-tensorflow*.zst
```

## Tensorflow 2.14
You can build TensorFlow 2.14 from the unstable "develop-upstream" branch with two changes: update the "last good commit" hash, and change the branch of the git source link.
You can find a good commit hash from [AMD's Jenkins CI server.](http://ml-ci.amd.com:21096/job/tensorflow/job/nightly-rocmfork-develop-upstream/job/nightly-build-whl/lastSuccessfulBuild/)
Then update the PKBUILD like:
```
...
#_known_good_commit=de8086e14ae3152906e1137c212d2f7bb8ea463a
 _known_good_commit=1d35245a829159ef76b3a403d704a78dcd672bbf 
...
#source=('tensorflow-upstream-rocm::git+https://github.com/ROCmSoftwarePlatform/tensorflow-upstream#branch=r2.12-rocm-enhanced'
 source=('tensorflow-upstream-rocm::git+https://github.com/ROCmSoftwarePlatform/tensorflow-upstream#branch=develop-upstream'
...
```
I have not tested this.

## Hardware supported
As of 2023-07-05, I have confirmed that RX 580 (gfx803) is NOT supported, and that you can get RX 6750 XT (gfx1031) to work using an environment variable:
```
export HSA_OVERRIDE_GFX_VERSION=10.3.0
```

### Pull requests welcome.
