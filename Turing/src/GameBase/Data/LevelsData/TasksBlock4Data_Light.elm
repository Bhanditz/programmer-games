module GameBase.Data.LevelsData.TasksBlock4Data_Light exposing                                   
            (basketsNumb4_1, machine4_1, input4_1, transTable4_1,                               
             expectedResult4_1, expectedPos4_1, usedCats4_1, usedBalls4_1,
             basketsNumb4_2, machine4_2, input4_2, transTable4_2,                               
             expectedResult4_2, expectedPos4_2, usedCats4_2, usedBalls4_2,
             basketsNumb4_3, machine4_3, input4_3, transTable4_3,
             expectedResult4_3, expectedPos4_3, usedCats4_3, usedBalls4_3,
             basketsNumb4_4, machine4_4, input4_4, transTable4_4,               
             expectedResult4_4, expectedPos4_4, usedCats4_4, usedBalls4_4)

import TuringMachine.TuringTypes exposing (Direction(..), Machine,             
                                           UserTransTable, Cell(..))           
import TuringMachine.RunTuring exposing (transFunc)                             
import GameBase.Data.GameTypes exposing (BallOfWool(..), Kitten(..))            
import GameBase.UI.MainObjects.Basket exposing (nineBaskets)
--(fourBaskets, fiveBaskets)

import Array exposing (Array, fromList)


-- BLOCK 4 : Analysis and comparison of the symbols (by transition to different     
-- states)---------------------------------------------------------------------


-- 4_1 - Add the same item, dont change empty word (for red, yellow, green 
-- first balls)

basketsNumb4_1 : Int                                                            
basketsNumb4_1 = nineBaskets --fourBaskets

machine4_1 : Machine BallOfWool Kitten                                          
machine4_1 =                                                                    
  { transition = (transFunc (fromList []) (Violet, Nothing, MoveLeft))          
  , initHeadPosForDraw = 3 --1
  , initHeadPosForMach = 0                                                      
  , startState  = White                                                          
  , acceptState = Orange                                                        
  , rejectState = Violet                                                        
  }                                                                             
                                                                                
transTable4_1 : UserTransTable BallOfWool Kitten                                
transTable4_1 = 
  fromList  
    [ { key   = (White, Just Red)                                              
      , value = { state = EmptyCell 
                , symb  = StableCell (Just Red)                       
                , dir   = StableCell (MoveRight)                              
                }                                                               
      , clickNum = 0                                                            
      } 
    , { key   = (White, Just Yellow)                                                
      , value = { state = EmptyCell                                      
                , symb  = StableCell (Just Yellow)                                   
                , dir   = StableCell (MoveRight)                                   
                }                                                                 
      , clickNum = 0                                                              
      }   
    , { key   = (White, Just Green)                                                
      , value = { state = EmptyCell                                     
                , symb  = StableCell (Just Green)                                   
                , dir   = StableCell (MoveRight)                                   
                }                                                                 
      , clickNum = 0                                                              
      } 
    , { key   = (White, Nothing) 
      , value = { state = StableCell (Orange)                                               
                , symb  = StableCell (Nothing)                                 
                , dir   = StableCell (MoveRight)                                  
                }                                                                 
      , clickNum = 0                                                              
      }  
    , { key   = (LightGrey, Nothing)                                                
      , value = { state = StableCell (Orange)                                     
                , symb  = StableCell (Just Red)                                   
                , dir   = StableCell (MoveLeft)                                   
                }                                                                 
      , clickNum = 0                                                              
      }   
    , { key   = (Grey, Nothing)                                                
      , value = { state = StableCell (Orange)                                     
                , symb  = StableCell (Just Yellow)                                   
                , dir   = StableCell (MoveLeft)                                   
                }                                                                 
      , clickNum = 0                                                              
      }   
    , { key   = (Brown, Nothing)                                              
      , value = { state = StableCell (Orange)                                  
                , symb  = StableCell (Just Green)                      
                , dir   = StableCell (MoveLeft)                             
                }                                                               
      , clickNum = 0  
      }                                                           
    ]      
                                                                                
input4_1 : List (Maybe BallOfWool)                                              
input4_1 =                                                                      
  [Just Red, Nothing, Nothing]                                                                     
                                                                                
expectedResult4_1 : List (Maybe BallOfWool)                                     
expectedResult4_1 =                                                             
  [Just Red, Just Red, Nothing]                                           
                                                                                
expectedPos4_1 : Int                                                            
expectedPos4_1 = 3 --1

usedCats4_1 : Array (Cell Kitten)                                               
usedCats4_1 = fromList [UserCell White, UserCell LightGrey, UserCell Grey,
                        UserCell Brown, UserCell DarkBrown]
                                                                                
usedBalls4_1 : Array (Cell (Maybe BallOfWool))                                  
usedBalls4_1 = fromList [UserCell (Just Red), UserCell (Just Yellow),           
                UserCell (Just Green), UserCell (Just Blue), UserCell Nothing]


-- 4_2 - Move the first (Yellow, Green, Blue) ball to the end of word (for 
-- empty word, one symb word, few symb word)

basketsNumb4_2 : Int                                                            
basketsNumb4_2 = nineBaskets --fiveBaskets

machine4_2 : Machine BallOfWool Kitten                                          
machine4_2 =                                                                    
  { transition = (transFunc (fromList []) (Violet, Nothing, MoveLeft))          
  , initHeadPosForDraw = 2 --0
  , initHeadPosForMach = 0                                                      
  , startState  = White                                                          
  , acceptState = Orange                                                        
  , rejectState = Violet                                                        
  }                                                                             
                                                                                
transTable4_2 : UserTransTable BallOfWool Kitten                                
transTable4_2 =                                                                 
  fromList                                                                      
    [ { key   = (White, Just Yellow)                                              
      , value = { state = EmptyCell                                             
                , symb  = EmptyCell                               
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key   = (White, Just Green)                                               
      , value = { state = StableCell (Grey)                                             
                , symb  = StableCell (Nothing)                               
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                       
    , { key   = (White, Just Blue)                                               
      , value = { state = StableCell (Brown)                                            
                , symb  = StableCell (Nothing)                                  
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }     
    , { key   = (White, Nothing)                                                  
      , value = { state = StableCell (Orange)                                   
                , symb  = StableCell (Nothing)                                  
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      } 
    , { key   = (LightGrey, Just Yellow)                                              
      , value = { state = StableCell (LightGrey)                                   
                , symb  = StableCell (Just Yellow)                                 
                , dir   = StableCell (MoveRight)                                 
                }                                                               
      , clickNum = 0                                                            
      }                   
    , { key   = (LightGrey, Just Green)                                              
      , value = { state = StableCell (LightGrey)                                   
                , symb  = StableCell (Just Green)                                 
                , dir   = StableCell (MoveRight)                              
                }                                                               
      , clickNum = 0                                                            
      }                              
    , { key   = (LightGrey, Just Blue)                                              
      , value = { state = StableCell (LightGrey)                                   
                , symb  = StableCell (Just Blue)                                 
                , dir   = StableCell (MoveRight)                                 
                }
      , clickNum = 0                                 
      }                             
    , { key   = (LightGrey, Nothing)                                              
      , value = { state = StableCell (Orange)                                   
                , symb  = EmptyCell                                
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      }
    , { key   = (Grey, Just Yellow)                                          
      , value = { state = StableCell (Grey)                                
                , symb  = StableCell (Just Yellow)                              
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key   = (Grey, Just Green)                                           
      , value = { state = StableCell (Grey)                                
                , symb  = StableCell (Just Green)                               
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key   = (Grey, Just Blue)                                            
      , value = { state = StableCell (Grey)                                
                , symb  = StableCell (Just Blue)                                
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                           
    , { key   = (Grey, Nothing)                                                   
      , value = { state = StableCell (Orange)                                   
                , symb  = StableCell (Just Green)                              
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      }
    , { key   = (Brown, Just Yellow)                                          
      , value = { state = StableCell (Brown)                                
                , symb  = StableCell (Just Yellow)                              
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key   = (Brown, Just Green)                                           
      , value = { state = StableCell (Brown)                                
                , symb  = StableCell (Just Green)                               
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key   = (Brown, Just Blue)                                            
      , value = { state = StableCell (Brown)                                
                , symb  = StableCell (Just Blue)                                
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }                                                                           
    , { key   = (Brown, Nothing)                                                  
      , value = { state = StableCell (Orange)                                   
                , symb  = EmptyCell
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    ] 

input4_2 : List (Maybe BallOfWool)                                              
input4_2 =                                                                      
  [Just Yellow, Just Green, Just Blue, Nothing]                                                  
                                                                                
expectedResult4_2 : List (Maybe BallOfWool)                                     
expectedResult4_2 =                                                             
  [Nothing, Just Green, Just Blue, Just Yellow]                                                 
                                                                                
expectedPos4_2 : Int                                                            
expectedPos4_2 = 4 --2                                                              
                                                                                
usedCats4_2 : Array (Cell Kitten)                                               
usedCats4_2 = fromList [UserCell White, UserCell LightGrey, UserCell Grey,
                        UserCell Brown, UserCell DarkBrown]
                                                                                
usedBalls4_2 : Array (Cell (Maybe BallOfWool))                                  
usedBalls4_2 = fromList [UserCell (Just Red), UserCell (Just Yellow),           
                UserCell (Just Green), UserCell (Just Blue), UserCell Nothing]


-- 4_3 - Move the last (Yellow, Green) ball to the left end of word (for empty 
-- word, one symb word, few symb word)

basketsNumb4_3 : Int                                                            
basketsNumb4_3 = nineBaskets --fourBaskets                                                    
                                                                                
machine4_3 : Machine BallOfWool Kitten                                          
machine4_3 =                                                                    
  { transition = (transFunc (fromList []) (Violet, Nothing, MoveLeft))          
  , initHeadPosForDraw = 3 --0                                                      
  , initHeadPosForMach = 1                                                      
  , startState  = White                                                          
  , acceptState = Orange                                                        
  , rejectState = Violet                                                        
  }                                                                             
                                                                                
transTable4_3 : UserTransTable BallOfWool Kitten                                
transTable4_3 =                                                                 
  fromList                                                                      
    [ { key   = (White, Just Yellow)                                              
      , value = { state = StableCell (White)                                             
                , symb  = StableCell (Just Yellow)                                          
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }             
    , { key   = (White, Just Green)                                              
      , value = { state = StableCell (White)                                             
                , symb  = StableCell (Just Green)                                            
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }    
    , { key   = (White, Nothing)                                                
      , value = { state = EmptyCell                                    
                , symb  = StableCell (Nothing)                                
                , dir   = StableCell (MoveLeft)                                
                }                                                               
      , clickNum = 0                                                            
      }   
    , { key   = (LightGrey, Just Yellow)                                                
      , value = { state = StableCell (Grey)                                    
                , symb  = StableCell (Nothing)                                
                , dir   = StableCell (MoveLeft)                                
                }                                                               
      , clickNum = 0                                                            
      }  
    , { key   = (LightGrey, Just Green)                                                
      , value = { state = EmptyCell                                    
                , symb  = EmptyCell
                , dir   = StableCell (MoveLeft)                                
                }                                                               
      , clickNum = 0                                                            
      }  
    , { key   = (LightGrey, Nothing)                                           
      , value = { state = StableCell (Orange)                                    
                , symb  = StableCell (Nothing)                                  
                , dir   = StableCell (MoveRight)                                 
                }                                                               
      , clickNum = 0                                                            
      }  
    , { key   = (Grey, Just Yellow)                                                
      , value = { state = StableCell (Grey)                                    
                , symb  = StableCell (Just Yellow)                                  
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      } 
    , { key   = (Grey, Just Green)                                           
      , value = { state = StableCell (Grey)                                    
                , symb  = StableCell (Just Green)                                  
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      } 
    , { key   = (Grey, Nothing)                                                
      , value = { state = StableCell (Orange)                                     
                , symb  = EmptyCell                               
                , dir   = StableCell (MoveRight)                                 
                }                                                               
      , clickNum = 0                                                            
      }  
    , { key   = (Brown, Just Yellow)                                               
      , value = { state = StableCell (Brown)                                     
                , symb  = StableCell (Just Yellow)                              
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key   = (Brown, Just Green)                                                
      , value = { state = StableCell (Brown)                                     
                , symb  = StableCell (Just Green)                               
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      }                                                                         
    , { key   = (Brown, Nothing)                                                   
      , value = { state = StableCell (Orange)                                   
                , symb  = StableCell (Just Green)                              
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      } 
    ]                                                                           
                                                                                
input4_3 : List (Maybe BallOfWool)                                              
input4_3 =                                                                      
  [Nothing, Just Yellow, Just Green, Nothing]                                 
                                                                                
expectedResult4_3 : List (Maybe BallOfWool)                                     
expectedResult4_3 =                                                             
  [Just Green, Just Yellow, Nothing, Nothing]                                 
                                                                                
expectedPos4_3 : Int                                                            
expectedPos4_3 = 4 --1                                                             
                                                                                
usedCats4_3 : Array (Cell Kitten)                                               
usedCats4_3 = fromList [UserCell White, UserCell LightGrey, UserCell Grey,
                        UserCell Brown, UserCell DarkBrown]
                                                                                
usedBalls4_3 : Array (Cell (Maybe BallOfWool))                                  
usedBalls4_3 = fromList [UserCell (Just Red), UserCell (Just Yellow),           
                UserCell (Just Green), UserCell (Just Blue), UserCell Nothing]


-- 4_4 - Swap the first and the last balls

basketsNumb4_4 : Int                                                            
basketsNumb4_4 = nineBaskets --fiveBaskets                                                    
                                                                                
machine4_4 : Machine BallOfWool Kitten                                          
machine4_4 =                                                                    
  { transition = (transFunc (fromList []) (Violet, Nothing, MoveLeft))          
  , initHeadPosForDraw = 2 --0                                                      
  , initHeadPosForMach = 1                                                     
  , startState  = White                                                          
  , acceptState = Orange                                                        
  , rejectState = Violet                                                        
  }                                                                             
                                                                                
transTable4_4 : UserTransTable BallOfWool Kitten                                
transTable4_4 =                                                                 
  fromList                                                                      
    [ { key   = (White, Just Yellow)                                              
      , value = { state = EmptyCell
                , symb  = EmptyCell                              
                , dir   = StableCell (MoveRight)                                             
                }                                                               
      , clickNum = 0                                                            
      }   
    , { key   = (White, Nothing)                                              
      , value = { state = StableCell (Orange)                                
                , symb  = StableCell (Nothing)                                  
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }   
    , { key   = (LightGrey, Just Yellow)                                              
      , value = { state = StableCell (LightGrey)                                
                , symb  = StableCell (Just Yellow)                              
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      } 
    , { key   = (LightGrey, Just Green)                                          
      , value = { state = StableCell (LightGrey)                                
                , symb  = StableCell (Just Green)                              
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }       
    , { key   = (LightGrey, Just Blue)                                           
      , value = { state = StableCell (LightGrey)                                
                , symb  = StableCell (Just Blue)                               
                , dir   = StableCell (MoveRight)                                
                }                                                               
      , clickNum = 0                                                            
      }        
    , { key   = (LightGrey, Nothing)                                           
      , value = { state = EmptyCell                                
                , symb  = StableCell (Nothing)                               
                , dir   = StableCell (MoveLeft)                                
                }                                                               
      , clickNum = 0                                                            
      }
    , { key   = (Grey, Just Blue)                                              
      , value = { state = EmptyCell                                     
                , symb  = EmptyCell                                  
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      } 
    , { key   = (Brown, Just Yellow)                                                 
      , value = { state = StableCell (Brown)                                    
                , symb  = StableCell (Just Yellow)                              
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      }      
    , { key   = (Brown, Just Green)                                              
      , value = { state = StableCell (Brown)                                    
                , symb  = StableCell (Just Green)                              
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      } 
    , { key   = (Brown, Just Blue)                                              
      , value = { state = StableCell (Brown)                                    
                , symb  = StableCell (Just Blue)                              
                , dir   = StableCell (MoveLeft)                                 
                }                                                               
      , clickNum = 0                                                            
      }                                        
    , { key   = (Brown, Nothing)                                              
      , value = { state = StableCell (Orange)                                    
                , symb  = StableCell (Just Blue)                             
                , dir   = StableCell (MoveRight)                                 
                }                                                               
      , clickNum = 0                                                            
      }                 
    ]                                                                           
                                                                                
input4_4 : List (Maybe BallOfWool)                                              
input4_4 =                                                                      
  [Nothing, Just Yellow, Just Green, Just Blue, Nothing]                                   
                                                                                
expectedResult4_4 : List (Maybe BallOfWool)                                     
expectedResult4_4 =                                                             
  [Nothing, Just Blue, Just Green, Just Yellow, Nothing]                                   
                                                                                
expectedPos4_4 : Int                                                            
expectedPos4_4 = 4 --2  

usedCats4_4 : Array (Cell Kitten)                                               
usedCats4_4 = fromList [UserCell White, UserCell LightGrey, UserCell Grey,
                        UserCell Brown, UserCell DarkBrown]
                                                                                
usedBalls4_4 : Array (Cell (Maybe BallOfWool))                                  
usedBalls4_4 = fromList [UserCell (Just Red), UserCell (Just Yellow),           
                UserCell (Just Green), UserCell (Just Blue), UserCell Nothing]
------------------------------------------------------------------------------- 
