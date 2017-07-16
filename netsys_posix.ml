(* $Id$ *)

open Unix
open Printf


module Debug = struct
  let enable = ref false
end

let dlog = Netlog.Debug.mk_dlog "Netsys_posix" Debug.enable
let dlogr = Netlog.Debug.mk_dlogr "Netsys_posix" Debug.enable

let () =
  Netlog.Debug.register_module "Netsys_posix" Debug.enable

external int64_of_file_descr : Unix.file_descr -> int64
  = "netsys_int64_of_file_descr"

let int_of_file_descr =
  match Sys.os_type with
    | "Unix" | "Cygwin" ->
	(fun fd -> (Obj.magic (fd:file_descr) : int))
    | _ ->
	(fun fd -> invalid_arg "Netsys.int_of_file_descr")

let file_descr_of_int =
  match Sys.os_type with
    | "Unix" | "Cygwin" ->
	(fun n -> (Obj.magic (n:int) : file_descr))
    | _ ->
	(fun n -> invalid_arg "Netsys.file_descr_of_int")

(* Limits  & resources *)

external sysconf_open_max : unit -> int = "netsys_sysconf_open_max";;

(* misc *)

external fchdir : Unix.file_descr -> unit = "netsys_fchdir" ;;
external fdopendir : Unix.file_descr -> Unix.dir_handle = "netsys_fdopendir" ;;
external realpath : string -> string = "netsys_realpath"
external get_nonblock : Unix.file_descr -> bool = "netsys_get_nonblock"

(* Process groups, sessions, terminals *)

external getpgid : int -> int = "netsys_getpgid";;
let getpgrp() = getpgid 0;;
external setpgid : int -> int -> unit = "netsys_setpgid";;
let setpgrp() = setpgid 0 0;;

external tcgetpgrp : file_descr -> int = "netsys_tcgetpgrp";;
external tcsetpgrp : file_descr -> int -> unit = "netsys_tcsetpgrp";;

external ctermid : unit -> string = "netsys_ctermid";;
external ttyname : file_descr -> string = "netsys_ttyname";;

external getsid : int -> int = "netsys_getsid";;

external posix_openpt : bool -> Unix.file_descr = "netsys_posix_openpt"
external grantpt : Unix.file_descr -> unit = "netsys_grantpt"
external unlockpt : Unix.file_descr -> unit = "netsys_unlockpt"
external ptsname : Unix.file_descr -> string = "netsys_ptsname"


let with_tty f =
  let fd = 
    try Unix.openfile (ctermid()) [Unix.O_RDWR] 0 
    with _ -> failwith "Netsys_posix.with_tty: cannot open terminal" in
  try
    let r = f fd in
    Unix.close fd;
    r
  with error -> Unix.close fd; raise error


let descr_input_line fd = (* unbuffered! *)
  let b = Buffer.create 80 in
  let s = Bytes.create 1 in

  let rec loop () =
    try
      let n = Unix.read fd s 0 1 in
      if n > 0 && Bytes.get s 0 <> '\n' then (
        #ifdef HAVE_BYTES
	  Buffer.add_bytes b s;
        #else
          Buffer.add_string b (Bytes.unsafe_to_string s);
        #endif
	raise(Unix.Unix_error(Unix.EINTR,"",""))
      )
    with
      | Unix.Unix_error(Unix.EINTR,_,_) ->
	  loop()
  in

  loop();
  Buffer.contents b



let tty_read_password ?(tty=Unix.stdin) prompt =
  if Unix.isatty tty then (
    let cleanup = ref [] in
    let f = Unix.out_channel_of_descr tty in
    output_string f prompt;
    flush f;
    Unix.tcdrain tty;
    Unix.tcflush tty Unix.TCIFLUSH;
    let p = Unix.tcgetattr tty in
    try
      let p' =
	{ p with
	    Unix.c_echo = false;
	    Unix.c_echoe = false;
	    Unix.c_echok = false;
	    Unix.c_echonl = false
	} in
      Unix.tcsetattr tty Unix.TCSAFLUSH p';
      cleanup := (fun () -> Unix.tcsetattr tty Unix.TCSAFLUSH p) :: !cleanup;
      let old_sigint = 
	Sys.signal Sys.sigint (Sys.Signal_handle(fun _ -> raise Sys.Break)) in
      cleanup := (fun () -> Sys.set_signal Sys.sigint old_sigint) :: !cleanup;
      let pw = descr_input_line tty in
      output_string f "\n";
      flush f;
      List.iter (fun f -> f()) !cleanup;
      pw
    with
      | error ->
	  List.iter (fun f -> f()) !cleanup;
	  if error = Sys.Break then (
	    output_string f "\n";
	    flush f
	  );
	  raise error
  )
  else
    descr_input_line tty


(* Users and groups *)

external setreuid : int -> int -> unit = "netsys_setreuid";;
external setregid : int -> int -> unit = "netsys_setregid";;
external initgroups : string -> int -> unit = "netsys_initgroups"

(* mknod *)

type node_type = 
  | S_IFREG 
  | S_IFCHR of int  (* major + minor *)
  | S_IFBLK of int  (* major + minor *)
  | S_IFIFO
  | S_IFSOCK
      
external mknod : string -> int -> node_type -> unit = "netsys_mknod"

(* poll *)

external pollfd_size : unit -> int = "netsys_pollfd_size"

let the_pollfd_size = pollfd_size()

let _have_poll = the_pollfd_size > 0
let have_poll() = _have_poll

type poll_req_events = int
type poll_act_events = int
type poll_cell =
    { mutable poll_fd : Unix.file_descr;
      mutable poll_req_events : poll_req_events;
      mutable poll_act_events : poll_act_events;
    }
type poll_mem
type poll_array =
  | Poll_mem of poll_mem * int (*length*)
  | Poll_emu of poll_cell array

let null_poll_cell =
  { poll_fd = Unix.stdin;
    poll_req_events = 0;
    poll_act_events = 0
  }

external mk_poll_mem : int -> poll_mem
  = "netsys_mk_poll_mem"

external set_poll_mem : poll_mem -> int -> Unix.file_descr -> int -> int -> unit
  = "netsys_set_poll_mem"

external get_poll_mem : poll_mem -> int -> (Unix.file_descr * int * int)
  = "netsys_get_poll_mem"

external blit_poll_mem : poll_mem -> int -> poll_mem -> int -> int -> unit
  = "netsys_blit_poll_mem"

external poll_constants : unit -> int array = "netsys_poll_constants"

let the_poll_constants = poll_constants()

let const_rd_event = the_poll_constants.(0)
let const_pri_event = the_poll_constants.(1)
let const_wr_event = the_poll_constants.(2)
let const_err_event = the_poll_constants.(3)
let const_hup_event = the_poll_constants.(4)
let const_nval_event = the_poll_constants.(5)

let poll_req_events rd wr pri =
  (if rd then const_rd_event else 0) lor
  (if wr then const_wr_event else 0) lor
  (if pri then const_pri_event else 0)

let poll_req_triple p =
  (p land const_rd_event <> 0,
   p land const_wr_event <> 0,
   p land const_pri_event <> 0
  )

let poll_null_events() = 0

let poll_result p = p <> 0
let poll_rd_result p = p land const_rd_event <> 0
let poll_wr_result p = p land const_wr_event <> 0
let poll_pri_result p = p land const_pri_event <> 0
let poll_err_result p = p land const_err_event <> 0
let poll_hup_result p = p land const_hup_event <> 0
let poll_nval_result p = p land const_nval_event <> 0

let poll_array_length =
  function
    | Poll_mem(_,n) -> n
    | Poll_emu e -> Array.length e

let set_poll_cell a k c =
  if k < 0 || k >= poll_array_length a then
    invalid_arg "Netsys.set_poll_cell";
  match a with
    | Poll_mem(s,_) ->
	set_poll_mem s k c.poll_fd c.poll_req_events (* c.poll_revents *) 0 
    | Poll_emu e ->
	e.(k) <- { c with poll_fd = c.poll_fd } (* copy *)

let get_poll_cell a k =
  if k < 0 || k >= poll_array_length a then
    invalid_arg "Netsys.get_poll_cell";
  match a with
    | Poll_mem(s,_) ->
	let (fd, ev, rev) = get_poll_mem s k in
	{ poll_fd = fd; poll_req_events = ev; poll_act_events = rev }
    | Poll_emu e ->
	let c = e.(k) in
	{ c with poll_fd = c.poll_fd }   (* copy *)

let blit_poll_array a1 k1 a2 k2 len =
  let l1 = poll_array_length a1 in
  let l2 = poll_array_length a2 in
  if len < 0 || k1 < 0 || k1+len > l1 || k2 < 0 || k2+len > l2 then
    invalid_arg "Netsys.get_poll_cell";
  match (a1, a2) with
    | (Poll_mem(s1,_), Poll_mem(s2,_)) ->
	blit_poll_mem s1 k1 s2 k2 len
    | (Poll_emu e1, Poll_emu e2) ->
	Array.blit e1 k1 e2 k2 len
    | _ ->
	assert false

let create_poll_array n =
  if _have_poll then (
    let s = mk_poll_mem n in
    Poll_mem(s,n)
  )
  else (
    let e = Array.make n null_poll_cell in
    Poll_emu e
  )

external netsys_poll : poll_mem -> int -> int -> int = "netsys_poll"


let concat_fd_list l =
  String.concat "," 
    (List.map
       (fun fd -> 
	  Int64.to_string(int64_of_file_descr fd))
       l
    )


(* win32 only: *)
external netsys_real_select : 
         Unix.file_descr list -> 
         Unix.file_descr list -> 
         Unix.file_descr list -> 
         float ->
           (Unix.file_descr list * Unix.file_descr list * Unix.file_descr list)
  = "netsys_real_select"

let real_select = 
  if Sys.os_type = "Win32" then
    netsys_real_select
  else
    Unix.select


let do_poll a k tmo =
  match a with
    | Poll_mem(s,_) ->
	netsys_poll s k tmo
    | Poll_emu e ->
	(* Emulate poll using Unix.select. This is slow! *)
	let tmo' =
	  if tmo < 0 then (-1.0) else float tmo *. 0.001 in
	let l_inp = ref [] in
	let l_out = ref [] in
	let l_pri = ref [] in
	for j = 0 to k-1 do
	  let c = e.(j) in
	  let (f_inp, f_out, f_pri) = poll_req_triple c.poll_req_events in
	  if f_inp then l_inp := c.poll_fd :: !l_inp;
	  if f_out then l_out := c.poll_fd :: !l_out;
	  if f_pri then l_pri := c.poll_fd :: !l_pri;
	done;
	dlogr (fun () ->
		 sprintf "poll_emulation request in=%s out=%s pri=%s tmo=%f"
		   (concat_fd_list !l_inp)
		   (concat_fd_list !l_out)
		   (concat_fd_list !l_pri)
		   tmo');
	let (o_inp, o_out, o_pri) = 
	  real_select !l_inp !l_out !l_pri tmo' in
	dlogr (fun () ->
		 sprintf "poll_emulation result in=%s out=%s pri=%s"
		   (concat_fd_list o_inp)
		   (concat_fd_list o_out)
		   (concat_fd_list o_pri));
	let a_inp = Array.of_list o_inp in
	let a_out = Array.of_list o_out in
	let a_pri = Array.of_list o_pri in
	Array.sort Pervasives.compare a_inp;
	Array.sort Pervasives.compare a_out;
	Array.sort Pervasives.compare a_pri;
	let n = ref 0 in
	for j = 0 to k-1 do
	  let c = e.(j) in
	  let g_inp = Netsys_impl_util.mem_sorted_array c.poll_fd a_inp in
	  let g_out = Netsys_impl_util.mem_sorted_array c.poll_fd a_out in
	  let g_pri = Netsys_impl_util.mem_sorted_array c.poll_fd a_pri in
	  let rev =
	    (if g_inp then const_rd_event else 0) lor
	    (if g_out then const_wr_event else 0) lor
	    (if g_pri then const_pri_event else 0) in
	  c.poll_act_events <- rev;
	  if rev <> 0 then incr n
	done;
	!n


let poll a k tmo =
  if k < 0 || k > poll_array_length a then
    invalid_arg "Netsys.poll";
  let r =
    Netsys_impl_util.slice_time_ms
      (fun tmo0 ->
	 (* tmo0 is now an int in milliseconds *)
	 let n = do_poll a k tmo0 in
	 if n = 0 then None else Some n
      )
      tmo in
  match r with
    | None -> 0
    | Some n -> n


let restarting_poll a k tmo =
  Netsys_impl_util.restart_tmo (poll a k) tmo

let poll_single fd r w pri tmo =
  let a = create_poll_array 1 in
  set_poll_cell a 0 { poll_fd = fd; 
		      poll_req_events = poll_req_events r w pri;
		      poll_act_events = poll_null_events()
		    };
  poll a 1 tmo > 0


let act_events_of_int n = n
let int_of_act_events n = n

let req_events_of_int n = n
let int_of_req_events n = n

(* poll aggregation *)

type netsys_event_source
type netsys_event_aggreg

type tagged_event =
  | EV_FD of Unix.file_descr

type event_push =
    { event_id : int;
      event_tag : tagged_event;
      event_api_req : int;
    }

class type event_source =
object
  method event_id : int
  method event_tag : tagged_event
  method push_record : event_push
  method need_push : bool
  method post_poll : int -> int -> unit
  method upd_kernel_events : int -> unit
  method set_post_modify_callback : (int -> unit) -> unit
  method clear_post_modify_callback : unit -> unit
  method modify_fd_event_source : int -> unit
  method act_events : int
end

class fd_event_source fd req : event_source =
  let event_id = ref 0 in
  let event_api_req = ref req in
  let event_kernel_req = ref 0 in
  let event_tag = EV_FD fd in
  let act_events = ref 0 in
  let post_modify_callback = ref None in
object(self)
  initializer (
    let id = Oo.id self in
    event_id := id
  )
    
  method event_id = !event_id
  method event_tag = event_tag
  method push_record =
    { event_id = !event_id;
      event_tag = event_tag;
      event_api_req= !event_api_req
    }
  method need_push = !event_api_req <> !event_kernel_req
  method upd_kernel_events req =
    event_kernel_req := req;
  method post_poll mask act = 
    event_kernel_req := !event_kernel_req land mask;
    act_events := act
  method set_post_modify_callback f =
    match !post_modify_callback with
      | None -> post_modify_callback := Some f
      | Some _ ->
	  failwith "Netsys_posix.add_event_source: the source is already \
                    added to an aggregator"
  method clear_post_modify_callback () =
    post_modify_callback := None
  method modify_fd_event_source req =
    event_api_req := req;
    match !post_modify_callback with
      | Some f -> f !event_id
      | None -> ()
  method act_events = !act_events
end

let fd_event_source fd req = 
  new fd_event_source fd req

let modify_fd_event_source es req =
  es # modify_fd_event_source req

let get_fd_of_event_source es =
  match es # event_tag with
    | EV_FD fd -> fd

let act_events_of_event_source es =
  es # act_events


external have_event_aggregation : unit -> bool
  = "netsys_have_event_aggregation"

external netsys_create_event_aggreg :
  bool -> netsys_event_aggreg
  = "netsys_create_event_aggreg"

external netsys_destroy_event_aggreg :
  netsys_event_aggreg -> unit
  = "netsys_destroy_event_aggreg"

external netsys_event_aggreg_fd :
  netsys_event_aggreg -> Unix.file_descr
  = "netsys_event_aggreg_fd"

external netsys_push_event_sources : 
  netsys_event_aggreg -> event_push list -> unit
  = "netsys_push_event_sources"

external netsys_add_event_source :
  netsys_event_aggreg -> event_push -> unit
  = "netsys_add_event_source"

external netsys_del_event_source :
  netsys_event_aggreg -> int -> tagged_event -> unit
  = "netsys_del_event_source"

external netsys_poll_event_sources :
  netsys_event_aggreg -> int -> (int * int * int) list
  (* The list are triples (event_id, mask, act) *)
  = "netsys_poll_event_sources"

external netsys_interrupt_aggreg :
  netsys_event_aggreg -> unit
  = "netsys_interrupt_aggreg"

class event_aggregator is_interruptible =
  let up = ref true in
  let all_sources = Hashtbl.create 27 in
  let upd_sources = Hashtbl.create 27 in
  let netsys = netsys_create_event_aggreg is_interruptible in
  let check_up() =
    if not !up then
      failwith "Netsys_posix: This event_aggregator is already destroyed" in
object(self)
  method add_event_source (es : event_source) =
    check_up();
    es # set_post_modify_callback self#post_modify_callback;
    try
      netsys_add_event_source netsys es#push_record;
      Hashtbl.replace all_sources es#event_id es;
      Hashtbl.replace upd_sources es#event_id es
    with
      | error ->
	  es # clear_post_modify_callback();
	  raise error
  method del_event_source (es : event_source) =
    check_up();
    if not(Hashtbl.mem all_sources es#event_id) then
      failwith "Netsys_posix.del_event_source: not member of this aggregator";
    netsys_del_event_source netsys es#event_id es#event_tag;
    es # clear_post_modify_callback();
    Hashtbl.remove all_sources es#event_id;
    Hashtbl.remove upd_sources es#event_id
  method post_modify_callback id =
    check_up();
    if (Hashtbl.mem all_sources id) then (
      let es = Hashtbl.find all_sources id in
      Hashtbl.replace upd_sources id es
    )
  method push_event_updates() =
    check_up();
    let l =
      Hashtbl.fold 
	(fun _ es acc -> 
	   if es # need_push then
	     let p = es#push_record in
	     es # upd_kernel_events p.event_api_req;
	     p :: acc
	   else
	     acc
	) 
	upd_sources
	[] in
    netsys_push_event_sources netsys l;
    Hashtbl.clear upd_sources
  method poll_event_sources tmo =
    self # push_event_updates();
    let v =
      Netsys_impl_util.slice_time_ms
	(fun millis ->
	   let evpairs0 = netsys_poll_event_sources netsys millis in
	   let evpairs1 = (* without spurious events *)
	     List.filter
	       (fun (id,_,_) ->
		  Hashtbl.mem all_sources id
	       )
	       evpairs0 in
	   let evpairs2 =
	     List.map
	       (fun (id,mask,act) ->
		  let es = Hashtbl.find all_sources id in
		  es#post_poll mask act;
		  Hashtbl.replace upd_sources id es;
		  es
	       )
	       evpairs1 in
	   if evpairs2 = [] then
	     None
	   else
	     Some evpairs2
	)
	tmo in
    match v with
      | None -> []
      | Some l -> l
  method event_aggregator_fd =
    check_up();
    netsys_event_aggreg_fd netsys
  method interrupt_event_aggregator() =
    netsys_interrupt_aggreg netsys
  method destroy_event_aggregator () =
    if !up then (
      netsys_destroy_event_aggreg netsys;
      up := false
    )
end

let create_event_aggregator = new event_aggregator
let add_event_source ea = ea # add_event_source
let del_event_source ea = ea # del_event_source
let push_event_updates ea = ea # push_event_updates()
let poll_event_sources (ea : event_aggregator) = ea # poll_event_sources
let event_aggregator_fd ea = ea # event_aggregator_fd
let destroy_event_aggregator ea = ea # destroy_event_aggregator()
let interrupt_event_aggregator ea = ea # interrupt_event_aggregator()


(* events *)

type not_event

external nsys_create_event : bool -> not_event = "netsys_create_not_event"
external set_nonblock_event : not_event -> unit = "netsys_set_nonblock_not_event"
external get_event_fd_nodup : not_event -> Unix.file_descr = "netsys_get_not_event_fd_nodup"
external set_event : not_event -> unit = "netsys_set_not_event"
external wait_event : not_event -> unit = "netsys_wait_not_event"
external consume_event : not_event -> unit = "netsys_consume_not_event"
external nsys_destroy_event : not_event -> unit = "netsys_destroy_not_event"
external nsys_return_all_event_fd : not_event -> Unix.file_descr list
  = "netsys_return_all_not_event_fd"

let create_event() = 
  let e = nsys_create_event true in
  List.iter
    (fun fd ->
       Netlog.Debug.track_fd
	 ~owner:"Netsys_posix" 
	 ~descr:"create_event"
	 fd;
    )
    (nsys_return_all_event_fd e);
  e

let destroy_event e =
  List.iter
    (fun fd ->
       Netlog.Debug.release_fd fd;
    )
    (nsys_return_all_event_fd e);
  nsys_destroy_event e


let get_event_fd e =
  let fd = get_event_fd_nodup e in
  let fd = Unix.dup fd in
  Unix.set_close_on_exec fd;
  fd


let report_signal_as_event ne signum =
  (* This is simpler to implement in Ocaml than in C:
     - [ne] is kept reachable all the time
     - we can pass [ne] to the handler via a closure
     - we can run non-async-signal-safe stuff in Ocaml signal handlers,
       because they are actually called indirectly
   *)
  Sys.set_signal 
    signum
    (Sys.Signal_handle
       (fun _ ->
	  set_event ne
       )
    )

(* post fork handlers *)

class type post_fork_handler =
object
  method name : string
  method run : unit -> unit
end

module PFH = struct
  type t = post_fork_handler
  let compare = Pervasives.compare
end

module PFH_Set = Set.Make(PFH)

let post_fork_registry = ref PFH_Set.empty
let post_fork_mutex = !Netsys_oothr.provider # create_mutex()

let register_post_fork_handler pfh =
  post_fork_mutex # lock();
  post_fork_registry := PFH_Set.add pfh !post_fork_registry;
  post_fork_mutex # unlock()

let remove_post_fork_handler pfh =
  post_fork_mutex # lock();
  post_fork_registry := PFH_Set.remove pfh !post_fork_registry;
  post_fork_mutex # unlock()

let run_post_fork_handlers() =
  PFH_Set.iter
    (fun pfh ->
       try pfh#run()
       with
	 | error ->
	     prerr_endline("Netsys_posix: Exception in post fork handler "
			   ^ pfh#name ^ ": " ^ Netexn.to_string error)
    )
    !post_fork_registry


(* "at" *)

type at_flag = AT_EACCESS | AT_SYMLINK_NOFOLLOW | AT_SYMLINK_FOLLOW | 
               AT_REMOVEDIR

(* The stubs assume these type definitions: *)
#ifdef HAVE_O_CLOEXEC
type open_flag1 = Unix.open_flag =
    O_RDONLY | O_WRONLY | O_RDWR | O_NONBLOCK | O_APPEND | O_CREAT | O_TRUNC
  | O_EXCL | O_NOCTTY | O_DSYNC | O_SYNC | O_RSYNC | O_SHARE_DELETE
  | O_CLOEXEC | O_KEEPEXEC
#else
#ifdef HAVE_O_SHARE_DELETE
type open_flag1 = Unix.open_flag =
    O_RDONLY | O_WRONLY | O_RDWR | O_NONBLOCK | O_APPEND | O_CREAT | O_TRUNC
  | O_EXCL | O_NOCTTY | O_DSYNC | O_SYNC | O_RSYNC | O_SHARE_DELETE
#else
type open_flag1 = Unix.open_flag =
    O_RDONLY | O_WRONLY | O_RDWR | O_NONBLOCK | O_APPEND | O_CREAT | O_TRUNC
  | O_EXCL | O_NOCTTY | O_DSYNC | O_SYNC | O_RSYNC
#endif
#endif

type access_permission1 = Unix.access_permission =
    R_OK | W_OK | X_OK | F_OK


external netsys_at_fdcwd : unit -> Unix.file_descr =
    "netsys_at_fdcwd"

let at_fdcwd = netsys_at_fdcwd()

external have_at : unit -> bool 
  = "netsys_have_at"
external openat :  Unix.file_descr -> string -> Unix.open_flag list -> 
                   Unix.file_perm ->  Unix.file_descr
  = "netsys_openat"
external faccessat : Unix.file_descr -> string -> Unix.access_permission list ->
                     at_flag list -> unit
  = "netsys_faccessat"
external mkdirat : Unix.file_descr -> string -> int -> unit 
  = "netsys_mkdirat"
external renameat : Unix.file_descr -> string -> Unix.file_descr -> string -> 
                    unit
  = "netsys_renameat"
external linkat : Unix.file_descr -> string -> Unix.file_descr -> string ->
                  at_flag list -> unit
  = "netsys_linkat"
external unlinkat : Unix.file_descr -> string -> at_flag list -> unit
  = "netsys_unlinkat"
external symlinkat : string -> Unix.file_descr -> string -> unit
  = "netsys_symlinkat"
external mkfifoat : Unix.file_descr -> string -> int -> unit
  = "netsys_mkfifoat"
external readlinkat : Unix.file_descr -> string -> string
  = "netsys_readlinkat"

(* Clocks *)

type timespec = float * int
type clock_id
type clock =
  (* also in Netlog *)
  | CLOCK_REALTIME
  | CLOCK_MONOTONIC
  | CLOCK_ID of clock_id

external nanosleep : timespec -> timespec ref -> unit = "netsys_nanosleep"
external clock_gettime : clock -> timespec = "netsys_clock_gettime"
         (* also in Netlog *)
external clock_settime : clock -> timespec -> unit = "netsys_clock_settime"
external clock_getres : clock -> timespec = "netsys_clock_getres"
external clock_getcpuclockid : int -> clock_id = "netsys_clock_getcpuclockid"

type timer_expiration =
  | TEXP_NONE
  | TEXP_EVENT of not_event
  | TEXP_EVENT_CREATE
  | TEXP_SIGNAL of int
type posix_timer

external have_posix_timer : unit -> bool
  = "netsys_have_posix_timer"

external nsys_timer_create : clock -> timer_expiration -> posix_timer
  = "netsys_timer_create"

external timer_settime : posix_timer -> bool -> timespec -> timespec -> unit
  = "netsys_timer_settime"

external timer_gettime : posix_timer -> timespec
  = "netsys_timer_gettime"

external timer_delete : posix_timer -> unit
  = "netsys_timer_delete"

external timer_event : posix_timer -> not_event
  = "netsys_timer_event"

let timer_create clock texp =
  let v = nsys_timer_create clock texp in
  Gc.finalise timer_delete v;
  v

(* Spawn *)

type wd_spec =
  | Wd_keep
  | Wd_chdir of string
  | Wd_fchdir of Unix.file_descr

type pg_spec =
  | Pg_keep
  | Pg_new_bg_group
  | Pg_new_fg_group
  | Pg_join_group of int

type fd_action =
  | Fda_close of Unix.file_descr
  | Fda_close_ignore of Unix.file_descr
  | Fda_close_except of bool array
  | Fda_dup2 of Unix.file_descr * Unix.file_descr

type sig_action =
  | Sig_default of int
  | Sig_ignore of int
  | Sig_mask of int list

external netsys_spawn : wd_spec -> pg_spec -> fd_action list -> 
                        sig_action list -> string array ->
                        string -> string array -> int
  = "netsys_spawn_byte" "netsys_spawn_nat"

external netsys_posix_spawn : pg_spec -> fd_action list -> 
                              sig_action list -> string array ->
                              string -> string array -> int
  = "netsys_posix_spawn_byte" "netsys_posix_spawn_nat"

external have_posix_spawn : unit -> bool
  = "netsys_have_posix_spawn"

let spawn ?(chdir = Wd_keep) ?(pg = Pg_keep) ?(fd_actions = [])
          ?(sig_actions = []) ?(env = Unix.environment()) 
          ?(no_posix_spawn=false) cmd args =
  (* Check whether we can use the faster netsys_posix_spawn *)
  let use_posix_spawn =
    not no_posix_spawn &&
    have_posix_spawn() &&
    chdir = Wd_keep &&
    pg <> Pg_new_fg_group &&
    not (List.exists
	   (fun sa -> match sa with Sig_ignore _ -> true | _ -> false) 
	   sig_actions) in
  
  try
    if not use_posix_spawn then
      failwith "USE_FORK_EXEC";

    netsys_posix_spawn pg fd_actions sig_actions env cmd args
      (* may also fail with "USE_FORK_EXEC" in some cases *)
  with
    | Failure "USE_FORK_EXEC" ->
	(* Fixup: if pg = Pg_new_fg_group, we remove any Sig_default for
	   SIGTTOU from sig_actions. Because of special handling, the effect
	   of Sig_default is enforced by the implementation, but this must be
	   done at [execve] time.
	 *)
	let sig_actions =
	  if pg = Pg_new_fg_group then
	    List.filter 
	      (fun spec -> spec <> Sig_default Sys.sigttou)
	      sig_actions
	  else
	    sig_actions in
	netsys_spawn chdir pg fd_actions sig_actions env cmd args

type watched_subprocess = 
    { atom_idx : int;
      mutable alive : bool;
      mutable allocated : bool;
    }

external netsys_watch_subprocess : int -> int -> bool -> Unix.file_descr * int
  = "netsys_watch_subprocess"

external netsys_ignore_subprocess : int -> unit
  = "netsys_ignore_subprocess"

external netsys_forget_subprocess : int -> unit
  = "netsys_forget_subprocess"

external netsys_get_subprocess_status : int -> Unix.process_status option
  = "netsys_get_subprocess_status"

external install_subprocess_handler : unit -> unit
  = "netsys_install_sigchld_handler"

external subprocess_cleanup_after_fork : unit -> unit
  = "netsys_subprocess_cleanup_after_fork"

external netsys_kill_subprocess : int -> int -> unit
  = "netsys_kill_subprocess"

external netsys_killpg_subprocess : int -> int -> unit
  = "netsys_killpg_subprocess"

external kill_all_subprocesses : int -> bool -> bool -> unit
  = "netsys_kill_all_subprocesses"

external killpg_all_subprocesses : int -> bool -> unit
  = "netsys_killpg_all_subprocesses"

let forget_subprocess ws =
  if ws.allocated then (
    netsys_forget_subprocess ws.atom_idx;
    ws.allocated <- false;
  );
  ws.alive <- false

let watch_subprocess pid pgid kill_flag =
  if pid <= 0 || pgid < 0 then
    invalid_arg "Netsys_posix.watch_subprocess";
  let fd, atom_idx = netsys_watch_subprocess pid pgid kill_flag in
  let ws = { atom_idx = atom_idx; alive = true; allocated = true } in
  Gc.finalise forget_subprocess ws;
  (fd, ws)

let ignore_subprocess ws =
  if not ws.alive then
    failwith "Netsys_posix.ignore_subprocess: stale reference";
  netsys_ignore_subprocess ws.atom_idx;
  ws.alive <- false

let get_subprocess_status ws =
  if not ws.alive then
    failwith "Netsys_posix.get_subprocess_status: stale reference";
  netsys_get_subprocess_status ws.atom_idx

let kill_subprocess signal ws =
  if ws.alive then
    netsys_kill_subprocess signal ws.atom_idx

let killpg_subprocess signal ws =
  if ws.alive then
    netsys_killpg_subprocess signal ws.atom_idx


let () =
  register_post_fork_handler
    ( object 
	method name = "subprocess_cleanup_after_fork"
	method run = subprocess_cleanup_after_fork
      end
    )

let register_subprocess_handler() =
  Netsys_signal.register_exclusive_handler
    ~name:"Sigchld handler in Netsys_posix"
    ~signal:Sys.sigchld
    ~install:install_subprocess_handler
    ()


(* locales *)

type langinfo =
    { nl_CODESET : string;
      nl_D_T_FMT : string;
      nl_D_FMT : string;
      nl_T_FMT : string;
      nl_T_FMT_AMPM : string;
      nl_AM_STR : string;
      nl_PM_STR : string;
      nl_DAY_1 : string;
      nl_DAY_2 : string;
      nl_DAY_3 : string;
      nl_DAY_4 : string;
      nl_DAY_5 : string;
      nl_DAY_6 : string;
      nl_DAY_7 : string;
      nl_ABDAY_1 : string;
      nl_ABDAY_2 : string;  
      nl_ABDAY_3 : string;  
      nl_ABDAY_4 : string;  
      nl_ABDAY_5 : string;  
      nl_ABDAY_6 : string;  
      nl_ABDAY_7 : string;  
      nl_MON_1 : string;  
      nl_MON_2 : string;  
      nl_MON_3 : string;  
      nl_MON_4 : string;  
      nl_MON_5 : string;  
      nl_MON_6 : string;  
      nl_MON_7 : string;  
      nl_MON_8 : string;  
      nl_MON_9 : string;  
      nl_MON_10 : string;  
      nl_MON_11 : string;  
      nl_MON_12 : string;  
      nl_ABMON_1 : string;  
      nl_ABMON_2 : string;  
      nl_ABMON_3 : string;  
      nl_ABMON_4 : string;  
      nl_ABMON_5 : string;  
      nl_ABMON_6 : string;  
      nl_ABMON_7 : string;  
      nl_ABMON_8 : string;  
      nl_ABMON_9 : string;  
      nl_ABMON_10 : string;  
      nl_ABMON_11 : string;  
      nl_ABMON_12 : string;  
      nl_ERA : string;  
      nl_ERA_D_FMT : string;  
      nl_ERA_D_T_FMT : string;  
      nl_ERA_T_FMT : string;  
      nl_ALT_DIGITS : string;  
      nl_RADIXCHAR : string;  
      nl_THOUSEP : string;  
      nl_YESEXPR : string;  
      nl_NOEXPR : string;  
      nl_CRNCYSTR : string;  
    }

external netsys_query_langinfo : string -> langinfo = "netsys_query_langinfo"

let cached_langinfo = ref None

let query_langinfo locale =
  if locale = "" then (
    match !cached_langinfo with
      | None ->
	  let li = netsys_query_langinfo "" in
	  cached_langinfo := Some li;
	  li
      | Some li -> li
  )
  else
    netsys_query_langinfo locale



(* syslog *)

type level = Netlog.level

type m_level =
  | LOG_EMERG | LOG_ALERT | LOG_CRIT | LOG_ERR | LOG_WARNING 
  | LOG_NOTICE | LOG_INFO | LOG_DEBUG

let trans_level =
  [ `Emerg, LOG_EMERG;
    `Alert, LOG_ALERT;
    `Crit, LOG_CRIT;
    `Err, LOG_ERR;
    `Warning, LOG_WARNING;
    `Notice, LOG_NOTICE;
    `Info, LOG_INFO;
    `Debug, LOG_DEBUG
  ]

type syslog_facility =
    [ `Authpriv
    | `Cron
    | `Daemon
    | `Ftp
    | `Kern
    | `Local0
    | `Local1
    | `Local2
    | `Local3
    | `Local4
    | `Local5
    | `Local6
    | `Local7
    | `Lpr
    | `Mail
    | `News
    | `Syslog
    | `User
    | `Uucp
    | `Default
    ]

type m_syslog_facility = 
  | LOG_AUTHPRIV
  | LOG_CRON
  | LOG_DAEMON
  | LOG_FTP
  | LOG_KERN
  | LOG_LOCAL0
  | LOG_LOCAL1
  | LOG_LOCAL2
  | LOG_LOCAL3
  | LOG_LOCAL4
  | LOG_LOCAL5
  | LOG_LOCAL6
  | LOG_LOCAL7
  | LOG_LPR
  | LOG_MAIL
  | LOG_NEWS
  | LOG_SYSLOG
  | LOG_USER
  | LOG_UUCP
  | LOG_DEFAULT

let trans_facility =
  [ `Authpriv, LOG_AUTHPRIV;
    `Cron, LOG_CRON;
    `Daemon, LOG_DAEMON;
    `Ftp, LOG_FTP;
    `Kern, LOG_KERN;
    `Local0, LOG_LOCAL0;
    `Local1, LOG_LOCAL1;
    `Local2, LOG_LOCAL2;
    `Local3, LOG_LOCAL3;
    `Local4, LOG_LOCAL4;
    `Local5, LOG_LOCAL5;
    `Local6, LOG_LOCAL6;
    `Local7, LOG_LOCAL7;
    `Lpr, LOG_LPR;
    `Mail, LOG_MAIL;
    `News, LOG_NEWS;
    `Syslog, LOG_SYSLOG;
    `User, LOG_USER;
    `Uucp, LOG_UUCP;
    `Default, LOG_DEFAULT;
  ]

type syslog_option =
    [ `Cons
    | `Ndelay
    | `Odelay
    | `Nowait
    | `Pid
    ]

type m_syslog_option =
  | LOG_CONS
  | LOG_NDELAY
  | LOG_ODELAY
  | LOG_NOWAIT
  | LOG_PID

let trans_syslog_option =
  [ `Cons, LOG_CONS;
    `Ndelay, LOG_NDELAY;
    `Odelay, LOG_ODELAY;
    `Nowait, LOG_NOWAIT;
    `Pid, LOG_PID;
  ]

external netsys_openlog : 
  string option -> m_syslog_option list -> m_syslog_facility -> unit
  = "netsys_openlog"

external netsys_syslog :
  m_syslog_facility -> m_level -> string -> unit
  = "netsys_syslog"

external netsys_closelog : unit -> unit = "netsys_closelog"

let openlog id_opt opts fac =
  try
    netsys_openlog
      id_opt
      ( List.map
	  (fun p -> List.assoc p trans_syslog_option)
	opts
      )
      ( List.assoc fac trans_facility )
  with
    | Not_found -> assert false
	  
let syslog fac lev msg =
  try
    netsys_syslog
      ( List.assoc fac trans_facility )
      ( List.assoc lev trans_level )
      msg
  with
    | Not_found -> assert false

let closelog = netsys_closelog


(* Sync *)

external fsync : Unix.file_descr -> unit = "netsys_fsync"
external fdatasync : Unix.file_descr -> unit = "netsys_fdatasync"


(* Optional POSIX functions *)

external have_fadvise : unit -> bool = "netsys_have_posix_fadvise"
type advice =
  | POSIX_FADV_NORMAL
  | POSIX_FADV_SEQUENTIAL
  | POSIX_FADV_RANDOM
  | POSIX_FADV_NOREUSE
  | POSIX_FADV_WILLNEED
  | POSIX_FADV_DONTNEED
  | FADV_NORMAL
  | FADV_SEQUENTIAL
  | FADV_RANDOM
  | FADV_NOREUSE
  | FADV_WILLNEED
  | FADV_DONTNEED
external fadvise : Unix.file_descr -> int64 -> int64 -> advice -> unit
                 = "netsys_fadvise"

external have_fallocate : unit -> bool = "netsys_have_posix_fallocate"
external fallocate : Unix.file_descr -> int64 -> int64 -> unit
                   = "netsys_fallocate"

(* POSIX shared memory *)

external have_posix_shm : unit -> bool = "netsys_have_posix_shm"
type shm_open_flag =
  | SHM_O_RDONLY
  | SHM_O_RDWR
  | SHM_O_CREAT
  | SHM_O_EXCL
  | SHM_O_TRUNC
external shm_open : string -> shm_open_flag list -> int -> file_descr
  = "netsys_shm_open"
external shm_unlink : string -> unit = "netsys_shm_unlink"

let shm_create prefix size =
  let pid = Unix.getpid() in
  let t = Unix.gettimeofday() in
  let rec loop n =
    let id = sprintf "%d/%f/%d" pid t n in
    let dg = Digest.to_hex (Digest.string id) in
    let dg8 = String.sub dg 0 8 in
    let name = sprintf "%s_%s" prefix dg8 in
    try
      let fd =
	shm_open
	  name [SHM_O_RDWR; SHM_O_CREAT; SHM_O_EXCL ] 0o600 in
      ( try Unix.fchmod fd 0o600
	with Unix.Unix_error(Unix.EINVAL,_,_) -> ()
	  (* OSX seems to throw EINVAL here *)
      );
      if size > 0 then
        Unix.ftruncate fd size;
      (fd, name)
    with
      | Unix.Unix_error(Unix.EEXIST,_,_) ->
          loop (n+1) in
  loop 0


type sem_kind = [ `Named | `Anonymous ]

type sem_rep

type 'sem_kind semaphore =
    Netsys_types.memory * sem_rep
      (* We keep a reference to the bigarray to prevent that it is
         collected while a semaphore is stored in it
       *)

type named_semaphore = [ `Named ] semaphore
type anon_semaphore = [ `Anonymous ] semaphore

type sem_open_flag =
  | SEM_O_CREAT
  | SEM_O_EXCL

type sem_wait_behavior =
  | SEM_WAIT_BLOCK
  | SEM_WAIT_NONBLOCK

let dummy_mem =
  Bigarray.Array1.create Bigarray.char Bigarray.c_layout 0

external have_anon_posix_semaphores : unit -> bool 
  = "netsys_have_sem_anon"

external have_named_posix_semaphores : unit -> bool 
  = "netsys_have_sem_named"

let have_posix_semaphores() =
  have_anon_posix_semaphores() && have_named_posix_semaphores()

external netsys_sem_size : unit -> int
  = "netsys_sem_size"

external netsys_sem_value_max : unit -> int
  = "netsys_sem_value_max"

let sem_size = netsys_sem_size()

let sem_value_max = netsys_sem_value_max()


external netsys_sem_open :
  string -> sem_open_flag list -> int -> int -> sem_rep
  = "netsys_sem_open"

let sem_open name flags mode init_value =
  if init_value < 0 || init_value > sem_value_max then
    invalid_arg "Netsys_posix.sem_open";
  let sr = netsys_sem_open name flags mode init_value in
  (dummy_mem, sr)

external netsys_sem_close : sem_rep -> unit 
  = "netsys_sem_close"

let sem_close (_,sr) = netsys_sem_close sr

external sem_unlink : string -> unit 
  = "netsys_sem_unlink"

let sem_create prefix initval =
  let pid = Unix.getpid() in
  let t = Unix.gettimeofday() in
  let rec loop n =
    let id = sprintf "%d/%f/%d" pid t n in
    let dg = Digest.to_hex (Digest.string id) in
    let dg8 = String.sub dg 0 8 in
    let name = sprintf "%s_%s" prefix dg8 in
    try
      let sem =
	sem_open
	  name [SEM_O_CREAT; SEM_O_EXCL] 0o600 initval in
      (sem, name)
    with
      | Unix.Unix_error(Unix.EEXIST,_,_) ->
          loop (n+1) in
  loop 0


external netsys_sem_init : 
  Netsys_types.memory -> int -> bool -> int -> sem_rep
  = "netsys_sem_init"

let sem_init mem pos pshared init_value =
  if pos < 0 || pos > Bigarray.Array1.dim mem - sem_size then
    invalid_arg "Netsys_posix.sem_init";
  if init_value < 0 || init_value > sem_value_max then
    invalid_arg "Netsys_posix.sem_init";
  let sr = netsys_sem_init mem pos pshared init_value in
  (mem,sr)

external netsys_as_sem : Netsys_types.memory -> int -> sem_rep
  = "netsys_as_sem"

let as_sem mem pos = 
  if pos < 0 || pos > Bigarray.Array1.dim mem - sem_size then
    invalid_arg "Netsys_posix.as_sem";
  let sr = netsys_as_sem mem pos in
  (mem,sr)

external netsys_sem_destroy : sem_rep -> unit
  = "netsys_sem_destroy"

let sem_destroy (_,sr) = netsys_sem_destroy sr
  
external netsys_sem_getvalue : sem_rep -> int
  = "netsys_sem_getvalue"

let sem_getvalue (_,sr) = netsys_sem_getvalue sr

external netsys_sem_post : sem_rep -> unit
  = "netsys_sem_post"

let sem_post (_,sr) = netsys_sem_post sr

external netsys_sem_wait : sem_rep -> sem_wait_behavior -> unit
  = "netsys_sem_wait"

let sem_wait (_,sr) b = netsys_sem_wait sr b


type ioprio_target =
  | Ioprio_process of int
  | Ioprio_pgrp of int
  | Ioprio_user of int

type ioprio =
  | Noprio
  | Real_time of int
  | Best_effort of int
  | Idle

external ioprio_get : ioprio_target -> ioprio = "netsys_ioprio_get"
external ioprio_set : ioprio_target -> ioprio -> unit = "netsys_ioprio_set"

let have_ioprio() =
  try let _ = ioprio_get(Ioprio_process(Unix.getpid())) in true
  with _ -> false
