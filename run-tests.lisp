(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "cl-json/test")
(asdf:load-system "fiveam")

(uiop:quit (if (asdf:test-system "cl-json") 0 1))
