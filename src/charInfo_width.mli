open CamomileLibraryDefault.Camomile

module Cfg = Cfg

val width: ?cfg: Cfg.t option -> UChar.t -> int
(** [width c] returns the column width of [c] where [c] is of type [Camomile.UChar.t] and the value returned is of type [int].
    This module is implemented purely in OCaml and follows the prototype of POSIX's wcwidth. i.e. If [c] is a printable character, the value is at least 0. If [c] is null character (L'\0'), the value is 0. Otherwise, -1 is returned.
*)

