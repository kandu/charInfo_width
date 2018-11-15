open CamomileLibraryDefault.Camomile

module Cfg = Cfg

let width ?(cfg: Cfg.t option= None) uchar=
  let ucs= UChar.int_of uchar in
  if ucs >= 0x20 && ucs < 0x7f then
    1 (* ascii printing char *)
  else if ucs = 0 then
    0
  else if ucs < 0x20 || ucs >= 0x7f && ucs < 0xa0 then
    -1 (* control characters *)
  else if Combining.(Codes.mem uchar set) then
    0
  else if Fullwidth.is_fullwidth ucs then
    2
  else
    match cfg with
    | Some widthTable-> 
      if Codes.mem uchar widthTable.unprintable then
        -1
      else if Codes.mem uchar widthTable.combining then
        0
      else if Codes.mem uchar widthTable.w2 then
        2
      else if Codes.mem uchar widthTable.w3 then
        3
      else if Codes.mem uchar widthTable.w4 then
        4
      else if Codes.mem uchar widthTable.w5 then
        5
      else if Codes.mem uchar widthTable.w6 then
        6
      else
        1
    | None-> 1

