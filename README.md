# ShadowTube
Analyzation features:
 - Video links
 - Complete comment history
## Installation
### Arch
`yay -S shadowtube`
### Other
1. Clone the repository and navigate to the directory
```
git clone https://github.com/danehobrecht/shadowtube.git && cd shadowtube
```
2. Install dependencies
```
pip3 install -r requirements.txt
```
3. [Configure torrc](#configure-torrc) (optional)
4. Launch an instance of Tor Browser
5. Execute 
```
python3 shadowtube
```
## Configure torrc
1. Hash a custom control password
```
tor --hash-password <password>
```
2. Open `torrc` with elevated privelages
```
nano /etc/tor/torrc
```
3. Append the hashed password to `HashedControlPassword` and uncomment `ControlPort`
```
...
## The port on which Tor will listen for local connections from Tor
## controller applications, as documented in control-spec.txt.
ControlPort 9151
## If you enable the controlport, be sure to enable one of these
## authentication methods, to prevent attackers from accessing it.
HashedControlPassword 16:872860B76453A77D60CA2BB8C1A7042072093276A3D701AD684053EC4C
#CookieAuthentication 1
...
```
### Additional security steps
To prevent unauthorized users from accessing `tor`, consider adding the following steps:
- Change your SOCKS5 and control ports to a port not commonly used
- **Important for users using cookie authentication**: Append the following lines to `torrc`
```
SocksPolicy accept 127.0.0.1
SocksPolicy reject *
```
This step limits connection only to the local loopback address, effectively limiting connections originating from the local machine.
- As always, [RTFM](https://2019.www.torproject.org/docs/documentation.html.en#UpToSpeed)
## Sample outputs
```
"Me at the zoo"
https://www.youtube.com/watch?v=jNQXAC9IVRw

[✓] United States — 199.249.230.78
[✓] Republic of Moldova — 178.17.174.164
[✓] Ukraine — 193.218.118.183
[✓] Seychelles — 37.228.129.5
[✓] United States — 199.249.230.158

No abnormal behavior detected
```
```
"Super clever, really like the use of chickens. The smaller scale interpretations seem to be popular as opposed to som..."
https://www.youtube.com/watch?v=Drx1DEXa0GM

[✓] Germany — 185.220.102.8
[✓] Seychelles — 37.228.129.5
[✓] Germany — 185.220.101.213

"This is good work. Feel your pain with the beatmap conversion."
https://www.youtube.com/watch?v=nWfF8wj19yk

[✓] Germany — 185.220.100.249
[✓] Unknown
[✓] Austria — 109.70.100.50

"Doesn't look like failing to me. Glad you enjoyed the map."
https://www.youtube.com/watch?v=e_pyT5yFuYY

[✓] Switzerland — 176.10.104.240
[✓] Germany — 185.220.101.144
[✓] China — 23.154.177.131

No abnormal behavior detected
```
## Prerequisites
 - [Python 3.7.3+ & pip3](https://www.python.org/downloads/)
 - [Tor Browser](https://www.torproject.org/)
 - [virtualenv](https://pypi.org/project/virtualenv/)
## Known compatability issues (subject to change)
 - Video premieres
 - Live streams
 - "Discussion", or, "Community" posts
 - Geometric unicode characters in titles
