#! /usr/bin/env -S awk -f

/License Description:.*/ { inlicense = 1;
                           for (i = 3; i <= NF; i++) $(i-2)=$i
                         }
/Vendor ID:.*/           { inlicense = 0; }
                         { if (inlicense) print $0 }
