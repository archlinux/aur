# Symlink latest kernel

Symlinks latest available kernel to `/usr/lib/modules/latest`.

This is a utility package for Arch Linux. It looks for all installed kernels in `/usr/lib/modules`, sorts by version, and symlinks most recent one as `latest`. Leverages pacman hooks to get the job done.

## Why?

Because some things should remain constant in this ever changing world. For example, browser URLs to kernel's documentation pages. Arch Linux is a fast-moving target, so I quickly got tired of having to manually fix URLs across all affected tabs after each system upgrade.

Somehow, kernel.org website provides [/latest/](https://www.kernel.org/doc/html/latest/) endpoint. So why wouldn't you enjoy the same on your local machine?

<i><a href="file:///usr/lib/modules/latest/build/Documentation/index.html">file:///usr/lib/modules/latest/build/Documentation/index.html</a></i>

_(Due to GitHub and/or browser restrictions, the link above may render as plain text instead of clickable link.)_

## Install

Install the [symlink-latest-kernel](https://aur.archlinux.org/packages/symlink-latest-kernel)<sup>AUR</sup> package.
