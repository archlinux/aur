(require "asdf")

(push (uiop/os:getcwd) asdf:*central-registry*)

(asdf:load-system "hu.dwim.stefil/test")

(uiop:quit (if (hu.dwim.stefil/test::test) 0 1))
