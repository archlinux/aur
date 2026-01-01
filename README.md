## dedupe-dir
simple script using duperemove to deduplicate btrfs, bcachefs, and xfs (bcachefs and xfs throw weird blkid error message I have not investigated yet, but somewhat work) directories of the user's choosing, either automatically, once a week, or manually
utilizes duperemove's hashfile functionality
systemd timer runs at niceness value of 15 so it won't lock up your system

# requirements
folders the user places in the config file must be read/write for the user, so no root folder, no /var, etc.
aforementioned config file located at ~/.config/dedupe.conf, an example config file is created on first run
requires duperemove and a bunch of other standard linux utilities

