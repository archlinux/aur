/*
 * LoginPasswordManager from Giuseppe Borzi <gborzi AT ieee DOT org>
 * A userscript modified to work with libpasswordmanager.so.
 * Copyright 2011 by Giuseppe Borzi
 */

var ans;

var Store = {
   set: function( values ) {
      ans = "\""+values[0]+"\"";
      for( var i = 1; i < values.length; i++ )
         ans = ans+",\""+values[i]+"\"";
   },
   dump: function() {
      if ( ans ) return ans;
      else return "";
   }
};

setValue = Store.set;

var PassMan = {};

PassMan.askstore = "Store Login/Password for this site?",
PassMan.askneverstore = "Click OK to never store Login/Password for this site",
PassMan.askpasstore = "Store new password for login: ",

PassMan.il = -1;
PassMan.ip = -1;
PassMan.inptg = null;

PassMan.findlp = function(doc) {
   var inptg = doc.getElementsByTagName("input"), ip = -1;
   for ( var i = 0; i < inptg.length; i++ )
      if ( inptg[i].type == "password" ) { ip = i; break; }
   var found = ip > -1;
   if ( found ) {
      this.ip = ip; this.inptg = inptg;
      for( var i = ip-1; i > -1; i--) if ( inptg[i].type == "text" ) { this.il = i; break; }
   }
   return found;
};

PassMan.buildLoginMenu = function( np, lp ) {
   var oSel=document.createElement("SELECT");
   oSel.addEventListener('change', function() {}, false);
   var oOpt=document.createElement("OPTION"); oOpt.innerHTML = "Which Login?";
   oSel.appendChild(oOpt);
   for( var i = 0 ; i < np; i++ ) {
      var oOpt=document.createElement("OPTION");
      oOpt.innerHTML = lp[2*i+1]; oSel.appendChild(oOpt);
   }
   return(oSel);
};

PassMan.fillp = function( np, lp ) {
   if ( this.il > -1 ) this.inptg[this.il].value = lp[1];
   this.inptg[this.ip].value = lp[2];
   if ( np > 1 ) {
      var il = this.il, ip = this.ip, inptg = this.inptg;
      var fUL = inptg[ip].parentNode; var oSel = this.buildLoginMenu(np,lp);
      var oLi = document.createElement("LI");
      oLi.className  = 'lgn_menu'; fUL.appendChild(oLi); oLi.appendChild(oSel);
      oSel.addEventListener('change', function(){
            var isel = oSel.selectedIndex; var jl = 2*isel-1;
            if ( jl > -1 ) {
              inptg[il].value = lp[jl]; inptg[ip].value = lp[jl+1];
            } else { inptg[il].value = ""; inptg[ip].value = "" }
         },false);
   }
};

PassMan.storelp = function( np, lp ) {
   var newlog = ( this.il == -1 ) ? "dummy": this.inptg[this.il].value,
       newpass = this.inptg[this.ip].value;
   if( newpass.length == 0 || newlog.length == 0 ) return;
   var jl = 0, jp;
   for( var i = 0; i < np; i++ ) {
      if( lp[2*i+1] == newlog ) { jl = 2*i+1; jp = jl+1; break; }
   }
   if ( jl == 0 ) {
      if( confirm(this.askstore) ) {
         var np1 = np+1; lp[0] = np1+'';
         lp.push(newlog,newpass); setValue(lp);
      } else {
         if( confirm(this.askneverstore) ) {
             var nostore = ["0"]; setValue(nostore);
         }
      }
   } else {
      if ( lp[jp] !== newpass && confirm(this.askpasstore+newlog) ) {
            lp[jp] = newpass; setValue(lp);
      }
   }
};

PassMan.fillogpass = function(doc) {
   if ( this.findlp(doc) ) {
      var lp = getValue(), storepass = true, np = 0;
      if ( lp.length > 0 ) {
         np = parseInt(lp[0]); storepass = np > 0;
         if ( storepass ) this.fillp( np, lp );
      }
   }
};

PassMan.dologpass = function(doc) {
   if ( this.findlp(doc) ) {
      var lp = getValue(), storepass = true, np = 0;
      if ( lp.length > 0 ) {
         np = parseInt(lp[0]); storepass = np > 0;
         //if ( storepass ) this.fillp( np, lp );
      }
      if ( storepass ) PassMan.storelp(np,lp);
   }
};

