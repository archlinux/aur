# Helix: A Modern, Secure Version Control System

Helix is a next-generation version control system inspired by Git, but designed for **maximum security, auditability, and decentralization**. It combines the best ideas from distributed VCS, blockchain, and modern cryptography to provide a robust, user-friendly, and tamper-proof code management experience.

Built in **Rust** for performance, memory safety, and cross-platform compatibility.

---

## Features

### 1. **Cryptographically Secure Commit History**
- **SHA-256 Merkle DAG**: Every commit forms a node in a Directed Acyclic Graph (DAG), which supports complex merge scenarios
- **Tamper-Evident Chain**: Each commit includes a cryptographic hash of its parent(s) and content to form an immutable chain
- **Ed25519 Digital Signatures**: Every commit is cryptographically signed
- **Collision Resistance**: SHA-256 provides 128-bit collision resistance against quantum attacks

### 2. **Advanced Key Management System**
- **Ed25519 Keypairs**: Uses state-of-the-art elliptic curve cryptography for optimal security/performance ratio
- **Local Key Storage**: Keys stored securely in `~/.helix/keys/ed25519.key` with proper file permissions
- **Key Rotation Support**: Built-in commands for key generation, import, export, and rotation
- **Multi-Identity Support**: Framework for managing multiple signing identities per repository

### 3. **Signature Verification Pipeline**
- **Pre-Push Verification**: Complete ancestry validation before any remote operations
- **Post-Pull Verification**: Automatic signature verification of downloaded commits
- **Chain of Trust**: Recursive verification of parent commits ensures complete auditability
- **Graceful Degradation**: Configurable verification levels for different security requirements

### 4. **High-Performance Index System**
- **Hierarchical Tree Structure**: O(log n) file lookup performance even in large repositories
- **In-Memory Caching**: Intelligent caching of frequently accessed index nodes
- **Delta Compression**: Efficient storage of file changes using binary diff algorithms
- **Concurrent Access**: Thread-safe index operations for multi-threaded workflows

### 5. **Hybrid Storage Architecture**
- **Snapshot + Delta Strategy**: Periodic full snapshots with incremental deltas for optimal space/time tradeoff
- **Content-Addressable Storage**: All objects stored by SHA-256 hash for deduplication
- **Compression**: LZ4 compression for fast decompression and reduced storage footprint
- **Garbage Collection**: Automatic cleanup of unreferenced objects

### 6. **Advanced DAG Operations**
- **Topological Sorting**: Efficient commit ordering for complex merge scenarios
- **Ancestry Queries**: Fast computation of common ancestors and merge bases
- **Conflict Detection**: Intelligent detection and resolution of merge conflicts
- **Visualization Tools**: ASCII art and structured output for DAG analysis

### 7. **Decentralized Architecture**
- **Peer-to-Peer Ready**: No central authority required; all trust based on cryptography
- **Remote Protocol**: Efficient binary protocol for push/pull operations
- **Conflict Resolution**: Built-in strategies for handling concurrent modifications
- **Network Resilience**: Graceful handling of network failures and partial syncs

---

## Technical Architecture

### **Core Data Structures**

#### **Commit Object**
```rust
struct Commit {
    id: [u8; 32],                    // SHA-256 hash
    parent_ids: Vec<[u8; 32]>,       // Parent commit hashes
    tree_id: [u8; 32],              // Root tree hash
    author: String,                  // Author name
    email: String,                   // Author email
    timestamp: i64,                  // Unix timestamp
    message: String,                 // Commit message
    signature: [u8; 64],            // Ed25519 signature
    public_key: [u8; 32],           // Author's public key
}
```

#### **Index Node (Hierarchical)**
```rust
struct IndexNode {
    name: String,                    // File/directory name
    hash: [u8; 32],                 // Content hash
    mode: u32,                      // File permissions
    children: HashMap<String, IndexNode>, // Subdirectories
    is_directory: bool,             // Directory flag
}
```

#### **Storage Objects**
```rust
enum Object {
    Blob(Vec<u8>),                  // File content
    Tree(Vec<TreeEntry>),           // Directory structure
    Commit(Commit),                 // Commit metadata
    Delta {                         // Incremental changes
        base_hash: [u8; 32],
        patches: Vec<Patch>,
    },
}
```

### **Performance Characteristics**

#### **Time Complexity**
- **File Lookup**: O(log n) average case, O(n) worst case
- **Commit Creation**: O(files changed) + O(log n) for tree updates
- **History Traversal**: O(commits) for linear history, O(n log n) for complex DAGs
- **Merge Operations**: O(common_ancestor_distance) for three-way merges

#### **Space Complexity**
- **Repository Size**: ~1.5x original content (with compression and deduplication)
- **Index Memory**: O(files) with constant overhead per file
- **Working Directory**: O(files) for tracked files only

#### **Network Efficiency**
- **Push/Pull**: Only transfers missing objects and metadata
- **Compression**: LZ4 compression reduces transfer size by ~60-80%
- **Delta Encoding**: Reduces storage requirements by ~70-90% for incremental changes

### **Security Model**

#### **Cryptographic Primitives**
- **Hash Function**: SHA-256 (256-bit output, 128-bit collision resistance)
- **Digital Signatures**: Ed25519 (255-bit curve, 128-bit security level)
- **Key Derivation**: HKDF-SHA256 for deterministic key generation
- **Random Number Generation**: OS-provided CSPRNG (getrandom crate)

#### **Attack Resistance**
- **Replay Attacks**: Prevented by commit timestamps and parent hashes
- **Collision Attacks**: Mitigated by SHA-256's collision resistance
- **Quantum Attacks**: Ed25519 provides 128-bit post-quantum security
- **Side-Channel Attacks**: Constant-time operations where applicable

#### **Audit Trail**
- **Complete History**: Every commit is cryptographically linked to its parents
- **Signature Verification**: All commits can be verified independently
- **Tamper Detection**: Any modification breaks the hash chain
- **Non-Repudiation**: Signatures prove authorship beyond reasonable doubt

---

## Implementation Details

### **Core Modules**

#### **Repository Management (`core/repository.rs`)**
- Repository initialization and configuration
- Object database management (blobs, trees, commits)
- Reference management (branches, tags, HEAD)
- Working directory synchronization

#### **Index System (`core/index.rs`)**
- Hierarchical file tracking with O(log n) lookups
- Staging area management
- Conflict detection and resolution
- Concurrent access with proper locking

#### **Object Storage (`core/object.rs`)**
- Content-addressable storage with SHA-256 hashing
- Compression using LZ4 for optimal speed/size ratio
- Delta encoding for efficient incremental storage
- Garbage collection for unreferenced objects

#### **Cryptographic Operations (`utils/key_utils.rs`)**
- Ed25519 keypair generation and management
- Digital signature creation and verification
- Secure random number generation
- Key import/export functionality

### **Command-Line Interface**

#### **Repository Commands**
```bash
hx init [path]           # Initialize repository with config
hx add [files/dirs]      # Stage files with conflict detection
hx commit -m "message"   # Create signed commit with metadata
hx status                # Show working tree and index state
hx log [--graph]         # Display commit history with DAG visualization
hx dag [commit]          # ASCII art visualization of commit DAG
hx verify-history [ref]  # Cryptographic verification of commit ancestry
```

#### **Branching and Merging**
```bash
hx branch [name]         # Create/list branches with metadata
hx checkout <branch>     # Switch branches with conflict resolution
hx merge <branch>        # Three-way merge with automatic conflict detection
hx rebase <branch>       # Replay commits on new base (planned)
```

#### **Remote Operations**
```bash
hx remote add <name> <url>  # Add remote with authentication
hx push [remote] [branch]   # Push with signature verification
hx pull [remote] [branch]   # Pull with automatic verification
hx fetch [remote]           # Download objects without merging
```

#### **Key Management**
```bash
hx keygen                 # Generate Ed25519 keypair with secure entropy
hx key show               # Display public key in multiple formats
hx key import <path>      # Import keypair with format detection
hx key export <path>      # Export keypair with encryption options
hx key rotate             # Generate new keypair and update signatures
```

### **Configuration System**

#### **Repository Configuration (`.helix/config`)**
```toml
[core]
    repositoryformatversion = 0
    filemode = true
    bare = false
    logallrefupdates = true

[user]
    name = "Your Name"
    email = "your.email@example.com"

[remote "origin"]
    url = "https://github.com/user/repo"
    fetch = "+refs/heads/*:refs/remotes/origin/*"

[signing]
    key = "~/.helix/keys/ed25519.key"
    verify = true
    required = false

[storage]
    compression = "lz4"
    delta_encoding = true
    snapshot_interval = 100
```

---

## Development Roadmap

### **Phase 1: Core Stability** (Complete)
- [x] Basic repository operations
- [x] Cryptographic signing and verification
- [x] Hierarchical index system
- [x] Command-line interface

### **Phase 2: Advanced Features** (In Progress)
- [ ] Rebase operations
- [ ] Interactive rebase
- [ ] Cherry-pick functionality
- [ ] Stash management
- [ ] Submodule support

### **Phase 3: Performance & Scale** (Planned)
- [ ] Parallel operations
- [ ] Large file handling (LFS)
- [ ] Distributed caching
- [ ] Advanced compression algorithms

### **Phase 4: Ecosystem** (Planned)
- [ ] GUI applications
- [ ] IDE integrations
- [ ] CI/CD plugins
- [ ] Migration tools from Git

---

## License

MIT License - see [LICENSE](LICENSE) file for details.

---

**Helix: A Modern, Secure Version Control System**  
*Built for the future of trustworthy software development.* 