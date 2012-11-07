(* construct a list *)
let l = 1 :: [] ;;
let l = [ 1 ; 2; 3 ] ;;
let l = [ 1 ] @ [ 2 ; 3 ] ;;
let l = 1 :: 2 :: 3 :: [] ;;
let fst::rest = l ;;
let fst::snd::third::rest = l ;;
let ls = match l with
    [] -> 0
  |  x::y::xs -> y
  |  x::[] -> x
;;

let third = List.nth [1 ;2 ;3] 2 ;;
let squares = List.map (fun x -> x * x) [ 1 ; 2 ; 3] ;;
let sum = List.fold_left (+) 0 [ 1 ; 2 ;  3] ;;
let product = List.fold_left ( * ) 1 [ 1 ; 2 ;  3] ;;
let gt4 = List.map ( fun x -> (x, x > 4) ) [ 1 ; 2 ; 3 ; 4 ; 5; 6 ] ;;
let gt4 = List.filter (fun x -> x > 4) [2 ; 4 ; 6; 8] ;;
let tf  = List.exists (fun x -> 10 = x) [ 1 ; 2 ; 10] ;;

let third = Array.get [| 1 ;2 ;3 |] 1;;
let squares = Array.map (fun x -> x * x) [| 1 ; 2 ; 3 |] ;;
let sum = Array.fold_left (+) 0 [| 1 ; 2 ;  3 |] ;;
let product = Array.fold_left ( * ) 1 [| 1 ; 2 ;  3 |] ;;
let gt4 = Array.map ( fun x -> (x, x > 4) ) [| 1 ; 2 ; 3 ; 4 ; 5; 6 |] ;;
let gt4 = Array.filter (fun x -> x > 4) [| 2 ; 4 ; 6; 8 |] ;;
let tf  = Array.exists (fun x -> 10 = x) [| 1 ; 2 ; 10 |] ;;

let f x = x ;;

let f (a,b) = (b,a) ;;

let f = (* closure *)
  let x = 9 in
  (fun y -> y * x)
;;
let rec map f = function
    []    -> []
  | x::xs -> (f x) :: (map f xs)
;;
let rec recmap f l =
  let rec rechelp accum l = match l with
      [] -> List.rev accum 
    | x::xs -> rechelp ((f x)::accum) xs
  in
  rechelp [] l
;;
let rec f n =
  if (n > 0) then f (n - 1) else n
;;

let rec f = function
   0 -> 0
 | n -> f (n - 1)
;;

let cond = true;;
let value1 = "a";;
let value2 = "b";;
let res = if (cond) then value1 else value2 ;;
let res = match x with
     x::xs -> Some (x::xs) (* pattern matching *)
   | []    -> None
;;
let not_none = match x with
     None -> false
   | _ -> true
;;

let a = 
    let x = 1.0 in
    let y = "huh" in
    (x,y) ;;(* tuples can be of mixed types *)
type color = { r : int ; g : int ; b : int };;
let b = { r = 1 ; g = 5; b = 5 } ;; (* structs *)
type cheese = Cheese of string;; 
let c = Cheese("Havarti");;
type coord = int * int;;
type foo = int;;

type pizza =   Crust of pizza | Pepperoni | Olives 
             | Cheese of pizza list ;;
let pizza = Crust(Cheese(
   [ Pepperoni ; Olives ; Crust(Pepperoni)]
));;
let rec just_crust_and_cheese = 
  function 
     Crust(x) -> just_crust_and_cheese x
   | Cheese([]) -> true
   | Cheese(x)  -> List.for_all just_crust_and_cheese x
   | _  -> false
;;
just_crust_and_cheese (Crust(Cheese([])));;
just_crust_and_cheese pizza;;

type expression = Int of int | Multiply of expression * expression 

let rec valueOf = function
     (Int x) -> x
  |  (Multiply (x,y)) -> (valueOf x) * (valueOf y)
;;

valueOf (Int 1);;
valueOf (Multiply (Int 2) (Int 4));;

let i = ref 0;;
let array =  [| 555 ; 777 ; 999 |];;
i := !i + 1;;
array.(!i) <- !i;;

module type Addable = sig 
    type t 
    val zero: t
    val add: t -> t -> t
end;;

module Integers = struct
    type t = int
    let zero = 0
    let add x y = x + y
end;;

module Floats = struct
    type t = float
    let zero = 0.0
    let add x y = x +. y
end;;

module AddAll = functor (X: Addable) -> struct
    type t = X.t
    let addAll x = List.fold_left X.add X.zero x
end;;


module IntAddAll = AddAll (Integers);;

IntAddAll.addAll( [ 1; 2; 3; 4; 5; 6 ] );;




