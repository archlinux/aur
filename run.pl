/*
 *
 * run.pl
 *
 * Copyright (C) 2016 frnmst (Franco Masotti) <franco.masotti@student.unife.it>
 *
 * This file is part of cplint-installer.
 *
 * cplint-installer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * cplint-installer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with cplint-installer.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

/* Patch to run the server in backround. This file should replace the one
 * provided in the repository.
 */

:- use_module(server).
:- use_module('lib/r_swish').
:- use_module(library(r/r_sandbox)).

% Using `localhost:3050`, we only bind to localhost interface!
% Use plain `3050` (or any port number you like) to make the server
% accessible from all network interfaces.

%:- initialization server(localhost:3050).
:- initialization main.

main:-
    server(3050),
    wait.

wait:-
    thread_get_message(_),
    halt.
