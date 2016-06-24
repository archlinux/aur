These files are essential part of openshift-origin-git package for arch linux.

PKGBUILD
install.sh
.SRCINFO


These files are optional scripts. They let you run a cluster once you have installed the package.

config.sh
0.read.config.sh
1.install.cluster.sh
2.install.certificate.sh
3.start.cluster.sh
4.stop.cluster.sh
5.delete.cluster.sh


This package depends on docker package.
docker.service should be enabled and started before running openshift origin cluster. You have to update docker configuration file to enable unsecured embedded docker registry.


PKGBUILD
    Package build specification.
    Source code is downloaded from GitHub.
    Binaries are built from source code and placed into /usr/bin .
    Some hooks are specified in the following script.
install.sh
    Install script is used when installing, upgrading or removing the package.
.SRCINFO
    Package metadata.

config.sh
    Sample configuration file. You can copy or edit it to your liking.
0.read.config.sh
    Shared dependency used by many scripts.
1.install.cluster.sh
    Create and start a new cluster configured by configuration file.
    Usage: 1.install.cluster.sh config.sh
2.install.certificate.sh
    Install your server's certificate and private key into cluster.
    Usage: 2.install.certificate.sh config.sh
3.start.cluster.sh
    Start an existing cluster that has been stopped.
    Usage: 3.start.cluster.sh config.sh
4.stop.cluster.sh
    Stop a running cluster. Docker containers will be destroyed, but they will be recreated upon restart.
    Usage: 4.stop.cluster.sh
5.delete.cluster.sh
    Delete a cluster and all it's data.
    Usage: 5.delete.cluster.sh config.sh
