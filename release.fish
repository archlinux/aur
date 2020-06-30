#!/usr/bin/env fish

set stripe_cli_version $argv[1]

echo "Making a new release of stripe-cli $stripe_cli_version"

echo "Getting checksum..."
set checksum (curl -L https://github.com/stripe/stripe-cli/releases/download/v$stripe_cli_version/stripe-checksums.txt | grep linux_x86_64.tar.gz | awk '{print $1}')

echo "Building PKGBUILD..."
sed "s/VERSION/$stripe_cli_version/g;s/CHECKSUM/$checksum/g" PKGBUILD.template >PKGBUILD

echo "Making and installing package locally..."
makepkg -i

echo "Generating .SRCINFO..."
makepkg --printsrcinfo >.SRCINFO

echo "Committing to git..."
git commit -am "Release of $stripe_cli_version"

echo "Testing that the new version works with stripe -v..."
if not stripe -v
    echo "Failed to run stripe!"
    exit 1
end

read -p 'echo "Ready to push? [Y/n] "' ok
if test $ok = "y" -o $ok = ""
    echo "Pushing..."
    git push origin master
    git push aur master
else
    echo "Exiting without pushing!"
    exit 1
end
