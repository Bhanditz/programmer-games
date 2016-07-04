module Turing3 exposing (..)

import Html exposing (Html, div, button, text)
import Array exposing (..)
import String exposing (..)
import List exposing (..)

-- BlueRedOrangeYellowGreenBlueRed qBrown  

-- | Tape head movement direction.
type Direction = MoveLeft | MoveRight

type alias Machine a b = 
  {
  -- | @'transition' s smb@ defines the behaviour of the machine when it
  -- is in state @s@ and @smb@ is the symbol under the tape head.
  -- The function returns the next state of the machine,
  -- the symbol overwriting the current symbol under the tape head,
  -- and the direction in which the tape head should move after overwriting.

  -- If @smb@ is @'Just' x@, that signifies that @x@ is the current symbol
  -- under the tape head.
  -- If @smb@ is 'Nothing', that means that the tape head is over a
  -- tape position that has not been initialised yet.

  transition    : b -> Maybe a -> (b, a, Direction)
  , startState  : b
  , acceptState : b 
  , rejectState : b
  }


type alias TapeCfg a = 
  { leftSyms : Array a  -- ^ symbols to the left of tape head
  , currSym : Maybe a  -- ^ symbol under the tape head
  , rightSyms : Array a  -- ^ symbols to the right of tape head
  }       


type alias MachineCfg a b =
  { currState : b     -- current state of machine
  , tapeCfg   : TapeCfg a
  }


-- | Replace symbol under tape head with new symbol, then move tape head.
updateTapeCfg : TapeCfg a -> a -> Direction -> TapeCfg a
updateTapeCfg {leftSyms, currSym, rightSyms} newSym dir =
  case dir of     
    MoveLeft ->
      let 
      -- Add element to the left end of a sequence to the right of tape head
        right = (Array.append (Array.repeat 1 newSym) rightSyms) 
      in
        if (Array.isEmpty leftSyms) then (TapeCfg empty Nothing right) 
        else (TapeCfg (Array.slice 0 -1 leftSyms) 
             (Array.get ((Array.length leftSyms)-1) leftSyms) right)
    MoveRight ->
      let
      -- Add element to the right end of a sequence to the left of tape head
        left = (Array.push newSym leftSyms)
      in
        if (Array.isEmpty rightSyms) then (TapeCfg left Nothing empty)
        else (TapeCfg left (Array.get 0 rightSyms) 
             (Array.slice 1 (Array.length rightSyms) rightSyms))


-- | Execute one transition step for given machine and config.
updateMachineCfg : Machine a b -> MachineCfg a b -> MachineCfg a b
updateMachineCfg m {currState, tapeCfg} =
  let (state', newSym, dir) = m.transition currState tapeCfg.currSym
  in (updateTapeCfg tapeCfg newSym dir)
     |> MachineCfg state' -- f <| x == f x  x |> f == f x


-- | Initialise tape with input word.
initTapeCfg : List a -> TapeCfg a
initTapeCfg w = 
  case w of 
    [] -> TapeCfg Array.empty Nothing Array.empty
    (x::xs) -> TapeCfg Array.empty (Just x) (Array.fromList xs)  


-- | Initialise machine config with input word.
initMachineCfg : Machine a b -> List a -> MachineCfg a b
-- init tape with input word and define current state with start state
initMachineCfg m input = MachineCfg (m.startState) (initTapeCfg input)


-- | Return true if the machine is in a final state.
machineCfgFinal : Machine a b -> MachineCfg a b -> Bool
machineCfgFinal m mcfg =
  mcfg.currState == m.acceptState || mcfg.currState == m.rejectState


-- run machine while not in final state. 
-- return the last machine configuration (state+tape)
run : Machine a b -> MachineCfg a b -> MachineCfg a b
run m mcfg = 
  if (machineCfgFinal m mcfg) then mcfg
  else (run m (updateMachineCfg m mcfg))  


-- print tape --> return tape as a list of symbols
printTapeCfg : TapeCfg a -> List String
printTapeCfg {leftSyms, currSym, rightSyms} = 
  case currSym of
    Just c -> (Array.toList (Array.map toString leftSyms)) ++ [toString c] ++
                     (Array.toList (Array.map toString rightSyms)) ++ [" "]
    Nothing -> (Array.toList (Array.map toString leftSyms)) ++ [" "] ++ 
                     (Array.toList (Array.map toString rightSyms)) ++ [" "]


-- print machine ---> return it as a string with the tape and the last state
printMachineCfg : MachineCfg a b -> String 
printMachineCfg {currState, tapeCfg} =
  String.concat [String.concat (printTapeCfg tapeCfg), "q", 
                                            (toString currState)," "]


-- | Return the last machine config for given input word until final state.
runMachine : Machine a b -> List a -> String
runMachine m w = 
        printMachineCfg (run m (initMachineCfg m w)) 
