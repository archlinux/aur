process = require('node:process');
pl = require('tau-prolog');
require("tau-prolog/modules/lists")(pl);
s = pl.create();
s.consult(process.argv[2], {
    success: function() {
        s.query(process.argv[3], {
            success: function(goal) {
                console.log(goal);
                s.answer({
                    success: function(answer) { console.log(answer); },
                    error:   function(err) { throw new Error(err); },
                    fail:    function() { console.log(false); },
                    limit:   function() { throw new Error("limit"); }
                });
            },
            error: function(err) { throw new Error(err); }
        });
    },
    error: function(err) { throw new Error(err); }
});
