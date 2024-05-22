To building Ente desktop to connect to a self hosted server,
make sure the `NEXT_PUBLIC_ENTE_ENDPOINT` environment variable is set before making the package.

For example:
export NEXT_PUBLIC_ENTE_ENDPOINT="https://myownenteserverdomain.com"
makepkg -sic

Or:
export NEXT_PUBLIC_ENTE_ENDPOINT="https://myownenteserverdomain.com"
yay -S ente-desktop-git
