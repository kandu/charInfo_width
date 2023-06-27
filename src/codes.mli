(** [Codes] expands some functions based on Camomile.USet,
    a module implements Sets of Unicode characters, implemented as sets of intervals.
*)

(** [USet.t] *)
type t

(** {3 extended functions} *)

(** based on add_range, [add_ranges l s] add a list of ranges [l] to [s]. *)
val add_ranges :
  (Camomile.UChar.t * Camomile.UChar.t) list -> t -> t

(** [tuple_to_range tuple] convert [tuple] to a UChar range *)
val tuple_to_range :
  int * int -> Camomile.UChar.t * Camomile.UChar.t

(** [of_tuple_list l] convert int tuple list [l] to a [USet.t] *)
val of_tuple_list : (int * int) list -> t

(** {3 Below are type signatures of the original [Camomile.USet] module} *)

val empty : t
val is_empty : t -> bool
val mem : Camomile.UChar.t -> t -> bool
val add : Camomile.UChar.t -> t -> t
val add_range :
  Camomile.UChar.t -> Camomile.UChar.t -> t -> t
val singleton : Camomile.UChar.t -> t
val remove : Camomile.UChar.t -> t -> t
val remove_range :
  Camomile.UChar.t -> Camomile.UChar.t -> t -> t
val union : t -> t -> t
val inter : t -> t -> t
val diff : t -> t -> t
val compl : t -> t
val compare : t -> t -> int
val equal : t -> t -> bool
val subset : t -> t -> bool
val from : Camomile.UChar.t -> t -> t
val after : Camomile.UChar.t -> t -> t
val until : Camomile.UChar.t -> t -> t
val before : Camomile.UChar.t -> t -> t
val iter : (Camomile.UChar.t -> unit) -> t -> unit
val iter_range :
  (Camomile.UChar.t -> Camomile.UChar.t -> unit) -> t -> unit
val fold : (Camomile.UChar.t -> 'a -> 'a) -> t -> 'a -> 'a
val fold_range :
  (Camomile.UChar.t -> Camomile.UChar.t -> 'a -> 'a) ->
  t -> 'a -> 'a
val for_all : (Camomile.UChar.t -> bool) -> t -> bool
val exists : (Camomile.UChar.t -> bool) -> t -> bool
val filter : (Camomile.UChar.t -> bool) -> t -> t
val partition : (Camomile.UChar.t -> bool) -> t -> t * t
val cardinal : t -> int
val elements : t -> Camomile.UChar.t list
val ranges : t -> (Camomile.UChar.t * Camomile.UChar.t) list
val min_elt : t -> Camomile.UChar.t
val max_elt : t -> Camomile.UChar.t
val choose : t -> Camomile.UChar.t
val uset_of_iset : Camomile.Private.ISet.t -> t
val iset_of_uset : t -> Camomile.Private.ISet.t

