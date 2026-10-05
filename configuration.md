# 配置与运行指南

[返回 README](../README.md)

## 配置上游

编辑 `/etc/mcpmux/mcpmux.toml`：

```toml
public_url = "https://example.com"
listen = "127.0.0.1:8088"
max_sessions = 32
session_idle_seconds = 600
# 如客户端会发送 Origin，明确允许它的来源。
origins = []

[upstreams.files]
type = "stdio"
command = "/usr/bin/node"
args = ["/opt/mcp-files/dist/index.js", "/srv/shared"]
# 子进程不继承网关环境；只接收 PATH、HOME 和这里配置的变量。
env = { NODE_ENV = "production" }
# 可选：文件内容为 TOML 字符串表，例如 API_KEY = "..."。
# env_file = "/etc/mcpmux/files-env.toml"

[upstreams.remote]
type = "http"
url = "https://remote.example/mcp"
# 可选：文件只包含上游的访问令牌，不能使用网关令牌。
bearer_file = "/etc/mcpmux/remote-bearer"

[upstreams.local]
type = "http"
url = "http://127.0.0.1:9001/mcp"

[routes.name_a]
# 可选：自定义公开路径；未指定时使用 /mcp/name_a
# path = "/tools"
upstream = "files"
scopes = ["mcp:access"]

[routes.name-b]
upstream = "remote"

[routes.name-c]
alias = "name_a"
# 别名的权限和 audience 独立；不会绕过授权。
scopes = ["mcp:access"]

[users.owner]
# 使用 mcpmux secret 生成的高熵密码的 SHA-256；不要填普通弱密码的 hash。
password_sha256 = "替换成64位sha256"
routes = ["name_a", "name-b", "name-c"]

[clients.my-client]
redirect_uris = ["http://127.0.0.1:8765/callback"]
routes = ["name_a", "name-c"]
```

可以多条路径指向同一个上游；不同用户/客户端可以访问不同路径。用户与客户端的 route 权限取交集。上游文件和 stdio 工作目录应允许 `mcpmux` 用户访问；systemd 默认隐藏 `/home`，上游建议放 `/opt`、数据放 `/srv` 或 `/var/lib/mcpmux`。服务以非 root 身份执行配置中的命令；配置文件只允许管理员修改。

修改后：

```sh
sudo mcpmux check /etc/mcpmux/mcpmux.toml
sudo systemctl restart mcpmux
sudo journalctl -u mcpmux -n 30 --no-pager
```

重启会撤销所有内存中的 OAuth 令牌并结束旧版会话，客户端重新授权/初始化。静态服务令牌按配置持久生效，删除对应配置并重启即可撤销。

## 身份验证与授权

实现 MCP 2026-07-28 的 OAuth 资源服务器要求：逐路径 RFC 9728 元数据、401 `WWW-Authenticate`、audience/resource 绑定、403 scope 提示、每次请求校验 Bearer。不接受查询字符串令牌，不透传入口令牌，不跟随上游 HTTP 重定向，验证 Origin。

内置授权服务器支持 OAuth 授权码 + 必须的 S256 PKCE、精确 redirect URI、授权请求和令牌请求必须携带相同 resource、一次性 60 秒授权码、1 小时 opaque 访问令牌、RFC 9207 `iss`。密码只用于授权页，并且无登录 cookie。密码需要使用程序生成的 256 位随机秘密；当前不是普通密码登录系统。

客户端必须在 TOML 中预注册：这是规范允许的注册方式。当前没有动态注册、CIMD、刷新令牌、第三方身份提供商或自动上游 OAuth 登录。OAuth 授权页仅用于登录和确认访问，不是管理后台。远端需要 OAuth 时，应单独取得并维护上游 token 文件。

客户端设置：

- MCP URL：`https://example.com/mcp/name_a`
- Client ID：TOML 中的 client 名称
- Client secret：空（public client）
- Callback：精确填写客户端实际使用的回调地址
- 登录用户：`owner`，密码从服务器 `/etc/mcpmux/owner-password` 私下读取

如果客户端只能自动注册、不能填写预注册的 client ID，当前版本不能直接连接；需要支持预注册的客户端。

对于支持自定义 Bearer 的命令行/IDE，可使用网关本地生成的服务令牌：

```sh
sudo mcpmux secret /etc/mcpmux/name-a-token
# 命令仅打印 SHA-256；将它加入下面的配置。
```

```toml
[tokens.name-a]
sha256 = "命令输出的64位hash"
subject = "owner"
route = "name_a"
scopes = ["mcp:access"]
```

实际秘密保存在指定文件。客户端发送 `Authorization: Bearer <文件内容>`。每个令牌只对应一个公开路径；别名需要自己的令牌。服务令牌适合可手工配置凭据的客户端，不能替代交互式客户端的 OAuth 流程。

## 传输边界

HTTP 上游透明转发 Streamable HTTP 的请求和响应，包括 2026-07-28 的请求级 SSE 和旧版 GET/DELETE 会话。旧版上游 session ID 被网关重新映射并绑定用户、客户端与公开路径，入口 Authorization/Origin/Cookie 不传给上游。旧版独立 `/sse` + `/messages` 传输不支持。

stdio 支持 2026-07-28 每请求独立进程和旧版 initialize 会话桥接：SSE 响应、GET 事件流、DELETE 结束会话、服务端请求及客户端响应。现代模式关闭响应流会销毁进程，旧版会话默认空闲 10 分钟回收。stdio 的事件回放不支持；普通调用超时 120 秒，`subscriptions/listen` 最长 24 小时。现代头/体版本、方法、工具或资源名称不匹配返回 HeaderMismatch；不转换旧版/新版协议语义，上游必须支持客户端选择的协议版本。现代 stdio 每请求进程要求上游本身支持无 initialize 的新规范，不能把旧版 stdio 服务当成新版服务使用。

## 开发和验证

```sh
cargo fmt --check
cargo clippy --locked --all-targets -- -D warnings
cargo test --locked
cargo build --locked
python3 tests/e2e.py target/debug/mcpmux
```

规范：[MCP authorization](https://modelcontextprotocol.io/specification/2026-07-28/basic/authorization)、[Streamable HTTP](https://modelcontextprotocol.io/specification/2026-07-28/basic/transports/streamable-http)。
