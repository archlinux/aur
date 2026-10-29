"""Exercise the installed entry point and pinned parser dependencies."""
import asyncio
import os
import tempfile
import time
from importlib.metadata import version

# Importing the package must select the private dependencies before MCP.
import jcodemunch_mcp
from jcodemunch_mcp.parser.extractor import parse_file
from mcp import ClientSession, StdioServerParameters
from mcp.client.stdio import stdio_client
from tree_sitter_language_pack import get_parser

assert version("mcp") == "1.30.0"
assert version("tree-sitter") == "0.25.2"
assert version("tree-sitter-fsharp") == "0.3.12"
parser = get_parser("python")
assert hasattr(type(parser), "timeout_micros")
parser.timeout_micros = 100_000
start = time.thread_time()
try:
    tree = parser.parse(("def marker():\n    pass\n" + ("# " + "x" * 78 + "\n") * 5000).encode())
except ValueError:
    tree = None
assert tree is None and time.thread_time() - start < 3

source = "type A() =\n    static member val Total = 0 with get, set\n    static member Make() = A()\n    member val Size = 0\n"
rows = {(s.qualified_name, s.kind) for s in parse_file(source, "a.fs", "fsharp")}
assert {("A", "type"), ("A.Total", "property"), ("A.Make", "method"), ("A.Size", "property")} <= rows, rows


async def verify_stdio():
    with tempfile.TemporaryDirectory() as home:
        env = dict(os.environ, HOME=home, XDG_CONFIG_HOME=home, XDG_CACHE_HOME=home)
        parameters = StdioServerParameters(command=os.environ["JCODEMUNCH_TEST_BINARY"], env=env)
        async with stdio_client(parameters) as (read, write):
            async with ClientSession(read, write) as session:
                initialized = await session.initialize()
                assert initialized.serverInfo.name == "jcodemunch-mcp"
                tools = await session.list_tools()
                assert any(tool.name == "menu" for tool in tools.tools)
                result = await session.call_tool("menu", {})
                assert not result.isError, result


asyncio.run(verify_stdio())
