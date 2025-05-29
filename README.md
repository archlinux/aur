# portchaos

Random fake TCP services on random ports for local testing, honeypots, firewall testing, and pentesting.

## 🛠 Features

- Spawns fake TCP services on random ports
- Useful for honeypot decoys, firewall testing, and pentesting simulations
- Optionally sends a banner when connected

## ⚙️ Installation

### 📦 Install from AUR

```bash
yay -S portchaos
```

### 🧪 Build from source:

```bash
git clone https://github.com/Hanashiko/portchaos.git
cd portchaos
go build -o portchaos main.go
sudo mv portchaos /usr/bin/
```

## 🚀 Usage

```bash
portchaos -n 10 -start 30000 -end 40000 -banner
```

| Flag      | Description                                   |
|-----------|-----------------------------------------------|
| `-n`      | Number of fake services to spawn (default: 5) |
| `-start`  | Start of port range (default: 30000)          |
| `-end`    | End of port range (Default: 40000)            |
| `-banner` | Send 'portchaos test banner' on connection    |


## 🧪 Testing

```bash
# See listening ports
ss -tuln | grep LISTEN

# Connect
telnet localhost <port>
nc localhost <port>

# Scan
nmap -p 30000-40000 localhost
```

