module GameBase.Data.LevelsData.TasksBlock2Data exposing                                   
            (machine2_1, input2_1, transTable2_1,                               
             expectedResult2_1, expectedPos2_1, usedCats2_1, usedBalls2_1,
             machine2_2, input2_2, transTable2_2,                               
             expectedResult2_2, expectedPos2_2, usedCats2_2, usedBalls2_2,
             machine2_3, input2_3, transTable2_3,
             expectedResult2_3, expectedPos2_3, usedCats2_3, usedBalls2_3)  
                                                                                
import TuringMachine.TuringTypes exposing ( Direction(..), Machine,             
                                            UserTransTable, Cell(..))           
import TuringMachine.RunTuring exposing (transFunc)                             
import GameBase.Data.GameTypes exposing (BallOfWool(..), Kitten(..))            
                                                                                
import Array exposing (Array, fromList)


--BLOCK 2 : Writing the sequence of balls on the tape-------------------------- 
                                                                                
-- 2_1 - arrange balls by colors of the rainbow (on empty tape)                 
machine2_1 : Machine BallOfWool Kitten                                          
machine2_1 =                                                                    
  { transition = (transFunc (fromList []) (Violet, Nothing, MoveLeft))          
  , initHeadPosForDraw = 0                                                      
  , initHeadPosForMach = 0                                                      
  , startState = White                                                          
  , acceptState = Orange                                                        
  , rejectState = Violet                                                        
  }                                                                             
                                                                                
transTable2_1 : UserTransTable BallOfWool Kitten                                
transTable2_1 =                                                                 
  fromList                                                                      
    [ { key = (White, Nothing)                                                  
      , value = { state = EmptyCell                                             
                , symb  = StableCell (Just Red)                                 
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key = (LightGrey, Nothing)                                              
       , value = { state = EmptyCell                                            
                 , symb  = StableCell (Just Yellow)                             
                 , dir   = StableCell (MoveRight)                               
                 }                                                              
       , clickNum = 0                                                           
      }                                                                         
    , { key = (Grey, Nothing)                                                   
       , value = { state = EmptyCell                                  
                 , symb  = StableCell (Just Green)                              
                 , dir   = StableCell (MoveRight)                               
                 }                                                              
       , clickNum = 0                                                           
      }                                                                         
    , { key = (Brown, Nothing)                                                  
      , value = { state = StableCell (Orange)                                    
                , symb  = StableCell (Just Blue)                                
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                      
    ]                                                                           
                                                                                
input2_1 : List (Maybe BallOfWool)                                              
input2_1 =                                                                      
  [Nothing]                                                                     
                                                                                
expectedResult2_1 : List (Maybe BallOfWool)                                     
expectedResult2_1 =                                                             
  [Just Red, Just Yellow, Just Green, Just Blue, Nothing]                                           
                                                                                
expectedPos2_1 : Int                                                            
expectedPos2_1 = 4

usedCats2_1 : Array (Cell Kitten)                                               
usedCats2_1 = fromList [UserCell White, UserCell LightGrey, UserCell Grey,
                        UserCell Brown]
                                                                                
usedBalls2_1 : Array (Cell (Maybe BallOfWool))                                  
usedBalls2_1 = fromList [UserCell (Just Red), UserCell (Just Yellow),           
                UserCell (Just Green), UserCell (Just Blue), UserCell Nothing]  


-- 2_2 - put balls on empty tape with a space after each one
machine2_2 : Machine BallOfWool Kitten                                          
machine2_2 =                                                                    
  { transition = (transFunc (fromList []) (Violet, Nothing, MoveLeft))          
  , initHeadPosForDraw = 1
  , initHeadPosForMach = 0                                                      
  , startState = White                                                          
  , acceptState = Orange                                                        
  , rejectState = Violet                                                        
  }                                                                             
                                                                                
transTable2_2 : UserTransTable BallOfWool Kitten                                
transTable2_2 =                                                                 
  fromList                                                                      
    [ { key = (White, Nothing)                                                  
      , value = { state = EmptyCell                                             
                , symb  = StableCell (Just Red)                                 
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key = (LightGrey, Nothing)                                              
       , value = { state = EmptyCell                                            
                 , symb  = EmptyCell                             
                 , dir   = StableCell (MoveRight)                               
                 }                                                              
       , clickNum = 0                                                           
      }                                                                         
    , { key = (Grey, Nothing)                                                   
       , value = { state = EmptyCell                                  
                 , symb  = StableCell (Just Green)                              
                 , dir   = StableCell (MoveRight)                               
                 }                                                              
       , clickNum = 0                                                           
      }                     
    , { key = (Grey, Just Blue)                                                   
       , value = { state = StableCell (Orange)                               
                 , symb  = StableCell (Just Blue)                             
                 , dir   = StableCell (MoveLeft)                               
                 }                                                              
       , clickNum = 0                                                           
      }        
    ]                                                                           
                                                                                
input2_2 : List (Maybe BallOfWool)                                              
input2_2 =                                                                      
  [Nothing, Nothing, Nothing, Nothing, Nothing, Nothing, Just Blue]
                                                                                
expectedResult2_2 : List (Maybe BallOfWool)                                     
expectedResult2_2 =                                                             
  [Just Red, Nothing, Just Green, Nothing, Just Green, Nothing, Just Blue]                                  
                                                                                
expectedPos2_2 : Int                                                            
expectedPos2_2 = 6   

usedCats2_2 : Array (Cell Kitten)                                               
usedCats2_2 = fromList [UserCell White, UserCell LightGrey, UserCell Grey,
                        UserCell Brown]
                                                                                
usedBalls2_2 : Array (Cell (Maybe BallOfWool))                                  
usedBalls2_2 = fromList [UserCell (Just Red), UserCell (Just Yellow),           
                UserCell (Just Green), UserCell (Just Blue), UserCell Nothing] 


-- 2_3 - put pairs of red and green balls and separate them by a space          
machine2_3 : Machine BallOfWool Kitten                                          
machine2_3 =                                                                    
  { transition = (transFunc (fromList []) (Violet, Nothing, MoveLeft))          
  , initHeadPosForDraw = 2
  , initHeadPosForMach = 0                                                      
  , startState = White                                                          
  , acceptState = Orange                                                        
  , rejectState = Violet                                                        
  }                                                                             
                                                                                
transTable2_3 : UserTransTable BallOfWool Kitten                                
transTable2_3 =                                                                 
  fromList                                                                      
    [ { key = (White, Nothing)                                                  
      , value = { state = EmptyCell                                             
                , symb  = StableCell (Just Red)                                 
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key = (LightGrey, Nothing)                                              
       , value = { state = EmptyCell                                            
                 , symb  = StableCell (Just Green)                                            
                 , dir   = StableCell (MoveRight)                               
                 }                                                              
       , clickNum = 0                                                           
      }                                                                         
    , { key = (Grey, Nothing)                                                   
       , value = { state = EmptyCell                                            
                 , symb  = StableCell (Nothing)                              
                 , dir   = StableCell (MoveRight)                               
                 }                                                              
       , clickNum = 0                                                           
      }                                                                         
    , { key = (Grey, Just Blue)                                                 
       , value = { state = StableCell (Orange)                                  
                 , symb  = EmptyCell                               
                 , dir   = StableCell (MoveLeft)                                
                 }                                                              
       , clickNum = 0                                                           
      }                                                                         
    ]   

input2_3 : List (Maybe BallOfWool)                                              
input2_3 =                                                                      
  [Nothing, Nothing, Nothing, Nothing, Nothing, Just Blue]             
                                                                                
expectedResult2_3 : List (Maybe BallOfWool)                                     
expectedResult2_3 =                                                             
  [Just Red, Just Green, Nothing, Just Red, Just Green, Nothing]      
                                                                                
expectedPos2_3 : Int                                                            
expectedPos2_3 = 6
                                                                                
usedCats2_3 : Array (Cell Kitten)                                               
usedCats2_3 = fromList [UserCell White, UserCell LightGrey, UserCell Grey,
                        UserCell Brown]
                                                                                
usedBalls2_3 : Array (Cell (Maybe BallOfWool))                                  
usedBalls2_3 = fromList [UserCell (Just Red), UserCell (Just Yellow),           
                UserCell (Just Green), UserCell (Just Blue), UserCell Nothing]
------------------------------------------------------------------------------- 
