module TuringTypes exposing (Direction(..), Machine, TapeCfg, MachineCfg, TransTable)

import Array exposing (Array)


-- | Tape head movement direction.                                              
type Direction = MoveLeft | MoveRight                                           
                                                                                
                                                                                
type alias Machine a b =                                                        
  { transition  : (b, Maybe a) -> (b, Maybe a, Direction)                       
  , initHeadPos : Int
  , startState  : b                                                             
  , acceptState : b                                                             
  , rejectState : b                                                             
  }                                                                             
                                                                                
                                                                                
type alias TapeCfg a =                                                          
  { leftSyms  : Array (Maybe a)   --  symbols to the left of tape head                   
  , currSym   : Maybe a           --  symbol under the tape head                          
  , rightSyms : Array (Maybe a)   --  symbols to the right of tape head                 
  }                                                                             
                                                                                
                                                                                
type alias MachineCfg a b =                                                     
  { currState : b         -- current state of machine                           
  , tapeCfg   : TapeCfg a                                                       
  }                                                                             
                                                                                
                                                                                
type alias KeyValue a b =                                                       
  { key : (b, Maybe a)                                                          
  , value : (b, Maybe a, Direction)                                             
  }                                                                             
                                                                                
                                                                                
type alias TransTable a b =                                                     
  List (KeyValue a b)                                                           
