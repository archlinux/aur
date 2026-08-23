import asyncio

import httpx_aiohttp

from isaacus import DefaultAioHttpClient


async def main() -> None:
    client = DefaultAioHttpClient()
    try:
        assert isinstance(client, httpx_aiohttp.HttpxAiohttpClient)
    finally:
        await client.aclose()

    assert client.is_closed


asyncio.run(main())
