<p align="center">
  <img src="https://raw.githubusercontent.com/canmi21/vane/refs/heads/latest/assets/vane.svg" alt="vane logo" width="300">
</p>

<p align="center">
  <b>Flow-based. Event-driven. Rust-native.<br/>Like a dandelion carried by the wind, it follows direction yet defines its own.</b>
</p>

<p align="center">
  <a href="https://lib.rs/crates/vane"><img align="center" src="https://img.shields.io/badge/lib.rs-vane-F09E64?style=flat&labelColor=2D333B&logo=rust" alt="Lib.rs"/></a>
  <a href="https://crates.io/crates/vane"><img align="center" src="https://img.shields.io/crates/v/vane?style=flat&color=F09E64&labelColor=2D333B&logo=rust" alt="Crates.io version"/></a>
  <a href="https://github.com/canmi21/vane/blob/main/LICENSE"><img align="center" src="https://img.shields.io/github/license/canmi21/vane?style=flat&color=FF6B6B&labelColor=2D333B&logo=github" alt="License"/></a>
  <a href="https://deepwiki.com/canmi21/vane"><img align="center" src="https://deepwiki.com/badge.svg" alt="Ask DeepWiki"/></a>
  <a href="https://github.com/canmi21/vane/graphs/contributors"><img align="center" src="https://img.shields.io/github/contributors/canmi21/vane?style=flat&color=6FCF97&labelColor=2D333B&logo=github" alt="Contributors"/></a>
  <a href="https://github.com/canmi21/vane/actions/workflows/release.yml"><img align="center" src="https://github.com/canmi21/vane/actions/workflows/release.yml/badge.svg" alt="Build Status"/></a>
  <a href="https://crates.io/crates/vane"><img align="center" src="https://img.shields.io/crates/d/vane?style=flat&color=9B5DE5&labelColor=2D333B&logo=rust" alt="Downloads"/></a>
  <a href="https://github.com/canmi21/vane/stargazers"><img align="center" src="https://img.shields.io/github/stars/canmi21/vane?style=flat&color=FFD43B&labelColor=2D333B&logo=github" alt="GitHub stars"/></a>
</p>

## What is Vane

Vane is a high-performance, flow-based network protocol engine written in Rust. It is designed to bridge the architectural gap between raw transport layer (L4) forwarding and complex application layer (L7) processing. Unlike traditional proxies that rely on static hierarchical configurations, Vane utilizes a dynamic, composable pipeline architecture that treats network connections as programmable flows.

Vane operates as a protocol funnel—connections enter at L4 (TCP/UDP), optionally pass through L4+ (TLS/QUIC inspection), and can terminate at any layer based on runtime flow decisions. HTTP is the primary application protocol at L7, with full support for HTTP/1.1, HTTP/2, HTTP/3, and WebSocket. The architecture is designed for extensibility to additional application protocols.

## Core Concepts

### Flow-Based Pipeline

Vane abandons the traditional "virtual host" configuration model in favor of a decision-tree architecture known as the Flow Engine. Every connection operates within a pipeline composed of two distinct plugin types:

- **Middleware:** Intermediate logic units that inspect traffic, modify state, or perform side effects (e.g., protocol detection, rate limiting, variable injection). Middleware can branch execution paths based on runtime logic.
- **Terminators:** Final execution units that decide the fate of a connection (e.g., proxy to an upstream target, abort connection, or upgrade to a higher protocol layer).

### The Layered Stack Architecture

Vane manages network traffic across three strictly defined architectural layers, allowing for precise control over the depth of packet inspection:

- **L4 (Transport):** Handles raw TCP streams and UDP datagrams. It provides high-performance switching based on IP stickiness, load balancing, and connection metadata.
- **L4+ (Carrier):** A specialized layer that handles encrypted protocols (TLS, QUIC). It can operate in two modes: transparent routing by extracting SNI, ALPN, and Connection IDs for passthrough forwarding, or full protocol termination to expose plaintext streams to L7.
- **L7 (Application):** The fully terminated layer where Vane acts as an HTTP server (HTTP/1.1, HTTP/2, HTTP/3). Here, the system utilizes a unified "Container" model to manipulate headers, bodies, and payloads using a full-duplex streaming engine.

### Two-Phase Dispatch

“Two-Phase” in Vane is **layer-dependent**, not a single global mechanism.

- **L4 (Transport):** No Two-Phase model. Traffic is handled with single-pass, stateless forwarding and flow decisions.
- **L4+ (Carrier):** Two-Phase refers to **UDP/QUIC fast–slow path separation**. Initial packets go through deep inspection and routing (slow path). Once a session is established, subsequent packets are forwarded in O(1) via CID and IP stickiness (fast path).
- **L7 (Application):** Two-Phase represents a **split request lifecycle**. Upstream fetching is implemented as a terminator that decouples client and upstream protocols, enabling full-duplex HTTP any-to-any bridging (H1↔H2↔H3) with independent protocol negotiation on each side.

## Distinctions

### Programmable vs. Configurable

Traditional proxies are configured around fixed roles; Vane is programmed as a flow engine. A single inbound connection can be routed, upgraded, or terminated at different layers based on runtime decisions. For example, Vane can route a TLS connection at **L4+** purely by inspecting SNI without terminating encryption, promote the same listener to **L7 HTTPX** when the domain requires full application handling, or apply **middleware** such as header-based authentication only for specific paths before proxying.

These flows are described declaratively in JSON, YAML, or TOML, yet execute on a compiled, zero-copy Rust data plane.

### Hybrid Plugin Ecosystem

Vane provides a **selectively extensible plugin model** aligned with its Flow Engine architecture.

- **Middleware (Extensible):** Middleware is fully programmable and user-definable. It can be implemented internally for zero-latency execution or externally via HTTP webhooks, Unix Domain Sockets, or external binaries/scripts (Lua, Python, Bash, etc.). This enables custom logic such as authentication, policy decisions, logging, and dynamic flow control without recompiling the core.
- **Terminators (Built-in Only):** Terminators are tightly bound to physical network operations (proxying, protocol upgrades, connection termination). Due to their direct interaction with the data plane, they are currently provided only as built-in implementations and cannot be externalized.

### Native QUIC & HTTP/3 Intelligence

Unlike proxies that treat UDP as a second-class citizen, Vane features a dedicated QUIC Carrier Engine. It includes custom virtual sockets, stream reassembly logic, and a specialized Muxer that allows the system to accept raw UDP packets, identify them as QUIC, and seamlessly transition them into a structured HTTP/3 application stream without losing context or performance.

## Technical Advantages

- **Zero-Copy Architecture:** The internal data plane heavily utilizes Rust's ownership model and `Bytes` abstractions to pass data between network layers without unnecessary memory allocation. On-demand extraction ensures that request headers and bodies are only loaded into memory when explicitly accessed via template resolution.
- **Full-Duplex Streaming:** The upstream drivers are architected to handle large-scale data transfer (e.g., multi-gigabyte streams) asynchronously. Request and response paths are decoupled, preventing head-of-line blocking and deadlocks common in synchronous proxy implementations.
- **Cross-Layer Context Continuity:** Vane maintains a unified key–value context that persists across **L4, L4+, and L7**. Connection metadata such as source IP/port, transport details, and handshake-derived attributes are propagated upward and remain accessible at higher layers. This allows L7 template rendering (`{{ ... }}`) and middleware logic to reference low-level connection and protocol state without re-parsing or breaking layer boundaries.
- **Stateful L4+ Routing:** Vane can route encrypted traffic without terminating the secure session. At the L4+ layer, it routes **TLS connections based on SNI and ALPN**, and **QUIC connections based on SNI** by parsing ClientHello metadata, enabling certificate-less, zero-trust routing decisions.
- **Hot-Swappable Configuration:** All layers of the stack—from L4 listeners and TLS certificates to L7 application pipelines—support runtime reconfiguration. The system employs a "Keep-Last-Known-Good" strategy to ensure stability during updates.

## Star History

<a href="https://www.star-history.com/#canmi21/vane&type=date&legend=top-left">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=canmi21/vane&type=date&theme=dark&legend=top-left" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=canmi21/vane&type=date&legend=top-left" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=canmi21/vane&type=date&legend=top-left" />
 </picture>
</a>

## License

MIT License © 2025 [Canmi](https://github.com/canmi21)

**✦** **`Polygon`** / **`Ethereum`**: `0x35D143d9DC624feC921a3925Fa84dea9d1DfDCAe`
If you found this project helpful, consider supporting domain & server maintenance.
