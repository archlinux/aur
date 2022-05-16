(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "babel-tests")

(uiop:quit (if (babel-tests:run) 0 1))
