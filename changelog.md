This version feels almost mature enough to where I would call it `v1.0`. But due to lack of production environment testing, it will stay `v0.3`

I'm hoping to be able to add hotfixes for any bugs unseen or necessary fixes.

Thanks to every single person who contributed to this project! I hope I didn't forget to mention any of you.

Here are the changes:

### Packages / Dependencies
- CMake Improvements (for better compatibility with Conan recipes). @madduci, @prince-chrismc, and The Conan team. #96
- Vcpkg Support. @thinking-tower #137
- Fix CMake problem when Crow is built in a subdirectory of another project. @rittelle #103
- More CMake Fixes. @ugermann #124
- Crow can now be installed on the system using `make install`. @ayaankhan98 #80

### Websockets
- **`Bug`** Reset the internal header variable before every read. (fixing potential issues where read is run and no actual data is taken from the socket). #44
- **`Bug`** Fixed potential crash when using SSL Websockets. @fran6co #44
- **`Feature`** Added support for non masked client messages. #44
- **`Feature`** Added functionality to send a ping message from the server. #44
- **`Feature`** Exposed methods to send Ping and Pong to the end-user. #44
- **`Feature`** Ping and Pong payloads to be larger than 127 bytes are now allowed. #44

### HTTP
- **`Feature`** Added Support for HTTP Compression using Zlib. @pierobot #93
- **`Feature`** Made Compression (and Zlib dependency) optional (via macro). @alejandroarmas #142
- **`Bug`** Fixed broken Static files due to Responses not being cleared. @rittelle #109
- **`Feature`** Added Catch-all Route. @Tibbel #122 #126
- **`Feature`** Users can now define anything they want a handler to return using the `returnable` class. #84
- **`Feature`** Crow handler can now have Response alone as an argument (without Request). @ayaankhan98 @klaus-moon #76
- **`Feature`** Server name can now be set to anything the User wants. @makaveli #79
- **`Feature`** More robust redirection tools. #87
- **`Feature`** methods `pop()`, `pop_list()`, `pop_dict()`, and `keys()` added to `query_string`. #132
- **`Feature`** Crow now handles `HEAD` and `OPTIONS` HTTP methods automatically. #117
- **`Bug`** Fixed issue where response is logged twice. #128

### Static Files
- **`Feature`** Created `static` folder similar to flask. #50
- **`Feature`** Static File support was enabled on Windows. @epajarre #55

### Mustache
- **`Feature`** Crow logs a warning if a template is not found. @rittelle #102

### Json
- **`Feature`** `crow::json::wvalue` can now return any Json type, not just Json objects. #70
- **`Feature`** `crow::json::wvalue` can now use either `std::unordered_map` or `std::map` (for organized results). #132
- **`Feature`** Added `lo()` method to json::rvalue, returns a vector of json::rvalue containing whatever a json object or list has. #132
- **`Feature`** Added constructor to create `crow::json::wvalue` from `std::vector`. #132
- **`Feature`** Added `keys()` method to json::rvalue. #132
- **`Feature`** Added `size()` to `crow::json::wvalue`. #132
- **`Feature`** Added `std::string()` operator to json::rvalue (allows `std::string(json["abc"]`). #132
- `dump()` is now part of `crow::json::wvalue` and is const. #70 @belugum #135
- **`Feature`** Added copy constructor to `crow::json::wvalue`. #132


### Documentation
- Added Guides / Tutorials powered by mkdocs. #71 #72 #73 #74 #95 #132 @wentasah #134 @thinking-tower #137
- Added in code documentation for most of the library. #65 #44 #61
- Cleaned up a small problem with `app.h` documentation. #44
- Small documentation error fix. @tibovanheule #114
- Readme changes. #71

### CI/CD
- Travis replaced with Drone.io. #120

### Testing / Examples
- Added Websocket tests. #44
- Added examples and tests for json and query_string new methods. #132
- **`Bug`** `#include` for `example_with_all`. @supersaiyanmode #63
- **`Bug`** Renamed CMake target: example -> basic_example. @supersaiyanmode #64
- **`Bug`** Crow now reports the actual port from ASIO when running. @ChoppinBlockParty #119
- **`Bug`** Mustache tests now included in coverage. #129

### Other
- `merge_all.py` is now windows compatible. #58
- Added `CROW_MAIN` Macro to avoid multiple definition error of static variables. @fckxorg #111 #118
- Crow's signal handler is now optional. @NRizzoInc @ilejn #85
- MSVC compatibility fixes. @sfinktah #101
- Better Xcode Compatibility. @dspverden #139
- Recast 64-bit size_t to 32-bit int to remove MSVC warnings. @sfinktah #106
- `uint` was replaced with `unsigned`, improving compatibility. @epajarre #54
- Middlewares are now in a subfolder rather than being on the same level as the core library. #51
- Moved Repository under "CrowCpp" organization.
 
