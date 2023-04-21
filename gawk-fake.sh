#!/bin/bash

echo -e "\e[1;33m ==> Oops! \e[0m\e[1;37mYou (or a script) called the gawk at /usr/bin/gawk. Calling\e[0m\e[1;32m mawk \e[0m\e[1;37minstead. Some programs may not build (e.g., glibc). This is not a bug. Happy coding!\e[0m"
mawk "${@}"