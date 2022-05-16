(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "3bmd-youtube")
(asdf:load-system "fiasco")

(uiop:quit (if (asdf:test-system "3bmd-youtube") 0 1))
