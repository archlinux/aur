With this release, Crow is production ready. I'm amazed and thankful for how far this project has come and I would like to thank everyone who contributed their time, skills, and money to move this project forward.
A special thanks to Crow's newest member, @luca-schlecker. Without his work, much of this release wouldn't be possible.

### Packages / Dependencies
- Proper CMake support (Crow is now a CMake target (library) as opposed to just using CMake to compile examples/tests). #228 #209 #218 #241
- Change Crow CMake dependencies based on downstream project requirements. @Leon0402 #231
- CMake install support. #228 #209 #218
- Crow can now be compiled using C++20. @Leon0402 #265
- Automated release process via release script. #162 #205 #228 #252
- CMake uninstall support. @navidcity #305
- Fixed local VCPKG manifest version. #207
- Fixed `vcpkg.json` to work on linux. @Borwe #330
- Added Crow license to `crow_all.h`. #165


### Framework
- **`Feature`** Allowed multiple source files for projects using Crow without the need for `#define CROW_MAIN`. #280 #186 @danielytics #192 @nekoffski #354
- **`Feature`** Added a type of middleware that runs per route rather than globally. @dranikpg #327
- **`Feature`** Replaced `dumb_timer_queue` with new `task_timer`. #278
- **`Feature`** Replaced the round robin approach to assigning connections to threads to a load balancing system. @belugum #289
- **`Feature`** Improved and optimize filename sanitization function. @neumannt #321
- **`Feature`** Added Middleware to handle CORS rules. @dranikpg #348
- **`Bug`** fixed issue where absolute unix paths were not sanitized. #334
- **`Feature`** Added function to run the Crow app asynchronously. #359
- **`Feature`** Added unsafe file loading functions. @zefrenchy #339
- **`Feature`** Added Base64 decoder. #260 @neumannt #324
- **`Feature`** Added function to get the port Crow is using. @nx10 #276
- **`Bug`** Worked around GCC 8.3 bug that prevented Crow from compiling. @nx10 @CircuitCoder #287
- **`Feature`** Updated Crow's thread count process to reflect the actual number of threads being used. #307


### Websockets
- **`Bug`** Fixed Issue where Crow assumes a single masked message means all other messages are masked as well. #282
- **`Feature`** Enforce Websocket protocol (opt-in). #282
- **`Feature`** Added functionality to get the remote IP address connected to the Websocket. #263


### HTTP
- **`Feature`** Implemented [Blueprints](https://crowcpp.org/guides/blueprints/) for project organization (similar to Flask's Blueprints). #181 #205 #208 #242
- **`Feature`** Upgraded, better integrated, and optimized the HTTP Parser Crow uses. #294 @navidcity #303 #349 @nekoffski #354 #371
- **`Feature`** Re-implemented the Trie crow uses to match rules with URLs. #166
- **`Bug`** Fixed problem where streaming a response would abruptly close the connection. #332
- **`Feature`** Crow now uses an enum for HTTP status codes (`200` or `status::OK` can be used). #230
- **`Feature`** Added several HTTP status codes. @Zhavok92 #227 @kingster #367
- **`Bug`** Fixed issue where enabling SSL but not using it caused incorrect redirects. #281
- **`Feature`** Added app option to set threshold beyond which Crow streams a response. #245
- **`Feature`** Catch-all Routes now have receive the error code in their `response` object. #205
- **`Bug`** **`API Breaking`** Modified Parser to only allow `GET` method on HTTP/0.9. #262
- **`Bug`** Fixed problem where static file info wasn't being cleared if no file was found. #338
- **`Feature`** Added Automatic UTF-8 support through a middleware. #202
- **`Feature`** Added content type constructor for `response`. @hg333 #212
- **`Bug`** Replaced `HTTPMethod::GET` with `HTTPMethod::Get` in `routing.h`. @d35ha #191
- **`Feature`** Recognized cleartext and SSL versions of HTTP/2 upgrade header. #332
- **`API Breaking`** Fixed incorrect styling in for `remote_ip_address`. @himanshu007-creator #200


### Multipart
- **`Feature`** **`API Breaking`** Part headers are now in a map rather than a vector. #358
- **`Feature`** Added function to get a part by name. #358
- **`Bug`** Fixed a problem where Crow failed to parse a multipart request made using .Net `HttpClient`. #332
- **`Feature`** **`API Breaking`** Added a boundary to the default content-type (gets set to the request's boundary if constructed from a request). #358
- **`Feature`** Parts and headers can be cast to integer or double. #358


### Mustache
- **`Feature`** Added support for C++ lambdas in Mustache. #299
- **`Feature`** **`API Breaking`** Added function to set a templates directory. #362
- **`Bug`** Fixed missing `;` in mustache escaping. #342
- **`Feature`** **`API Breaking`** returning `page.render()` from a route now sets `Content-Type` header to HTML. #346
- **`Bug`** Ensured const correctness in template_t. @neumannt #325


### JSON
- **`Feature`** JSON values can now be initialized using initializer lists. @lcsdavid #190 #203 #242
- **`Bug`** Fixed problem where JSON would output `nan` or `inf` values. @Vhuynh25 @rremigius #328
- **`Bug`** Fixed problem with excess recursion when reading JSON. @neumannt #326
- **`Bug`** Made JSON float output faster and more accurate. #203


### Logging
- **`Feature`** **`API Breaking`** Simplified creating a custom logger. #288 #290
- **`Feature`** Added Support for using local time in default logger. @kingster #368


### Documentation
- Added Landing Page. #197 #201 #228
- Updated Site theme. #197 #228
- Placed financial and code contributors on landing page. #228 #311 #373
- Updated install documentation and separated instructions for different OSes. #228 #238 #293
- Added Social media cards. #197 #203 #270
- Added donate button to site header. #197
- Added indicator for features introduced after `v0.1`. #197
- Added HTTP Authentication tutorial. #293
- Updated documentation to mention new features. #203 #228 #372
- Made API reference more readable by removing parts only intended for internal use. #372
- Improved visibility on readme gitter badge. #228
- Fixed several typos. #297
- Used proper markdown syntax in documentation. #270


### CI/CD
- Fixed issue where cpp-coveralls wasn't compatible with newer GCOV versions. #228
- Fixed issue where PR coverage would affect `master` coverage results. #228
- Fixed coveralls branch. #198
- Removed pip3 command from PR workflow. #270


### Testing / Examples
- Examples can now compile on Windows. #209
- Tests can now compile without `CROW_ENABLE_COMPRESSION` being defined. #209
- Added Tests for HTTPS (SSL) version of Crow. #228 #130
- **`Bug`** Fixed issue where the response stream test would randomly fail. #234
- Tests now use Debug build (debug flags + without optimization). #228
- Added unit test for server timeout. #277
- Updated catch2 to v2.13.8. @neumannt #322
- Added tests for content type constructor for `response`. @hg333 #213
- Updated examples and tests to include JSON initializer lists. #190 #203
- Fixed typo in `example_with_all.cpp`. @odeits #161


### Other
- Created a new logo. #172
- Updated Crow License. #172 #228
- Formatted framework source code using Crow's own clang-format rules (and created a bot to enforce the rules for all PRs). #286 #293
