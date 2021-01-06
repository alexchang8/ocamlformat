open Ocamlformat_lib
open Js_of_ocaml

let format s =
  let conf : Conf.t = Conf.conventional_profile in
  let kind = Conf.kind_of_ext "foo.ml" |> Option.get in
  let opts : Conf.opts =
    {debug= false; margin_check= false; format_invalid_files= false}
  in
  match kind with
  | Conf.Kind k -> (
      let res =
        Translation_unit.parse_and_format k ?output_file:None
          ~input_name:"dummy" ~source:s conf opts
      in
      match res with Ok ok -> ok | Error _ -> s )

let _ =
  Js.export "Ocamlformat"
    (object%js
       method format s = s |> Js.to_string |> format |> Js.string
    end )
