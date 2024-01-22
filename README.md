# Bare Server GO

- This is a complete bare server written in GO that is compliant with the [TompHTTP Server Specifications](https://github.com/tomphttp/specifications)

***NOTE: Unfinished*** *I skimmed the spec and wrote this only in a few hours. There are lots of unimplemented features and bugs. (and it's curtrently not very TOMP compatible)*
## Usage

### Prerequisites

- [GO](https://golang.org/doc/install)

### Installation

- Clone this repository
- To build run:
```bash
make all
```
- To run:
```bash
./bare-server-go start
```

### For more examples of usage see the [exaples](./examples) directory

#### Docker 

- To build AND run:
```bash
make docker
```

- To JUST build:
```bash
make docker-build
```

- To JUST run:
```bash
make docker-run
```

#### Docker Compose

- To build AND run:
```bash
make docker-compose
```

- To JUST build:
```bash
make docker-compose-build
```

- To JUST run:
```bash
make docker-compose-up
```

## Todo 

- [ ] V4 implementation with [quic-go](https://github.com/quic-go/quic-go)
- [ ] Websocket Support (V4)
- [ ] V3 implementation
- [ ] Websocket Support (V3) - Partial support
- [x] CLI
- [ ] Other ways of installing (AUR, Bash, etc.)
- [ ] Other Ways of Handling Routes (net/http, gorilla/mux, etc.) CURRENTLY ONLY SUPPORTS: [chi](https://github.com/go-chi/chi)
- [ ] Installable in your own project
- [ ] Older versions of the spec
