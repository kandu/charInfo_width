open Result

type widthTable = {
  combining : Codes.t;
  w2 : Codes.t;
  w3 : Codes.t;
  w4 : Codes.t;
  w5 : Codes.t;
  w6 : Codes.t;
}

type t = widthTable

val load_from_string : string -> (t, int) result

val load_from_path : string -> (t, int) result

val union : t -> t -> t

