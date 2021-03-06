module GameBase.UI.ControlObjects.ControlElements exposing 
     (runButtonDraw, runFastButtonDraw, levelDraw,
      runButtonX, runButtonY, runButtonW, runButtonH, fastRunButtonX) 
--helpMsgDraw,quesButtonDraw,quesButtonX,quesButtonY,quesButtonW,quesButtonH)
import Svg exposing (Svg, image, text, text')
import Svg.Attributes exposing ( fontSize, fontStyle, width, height, x, y,      
                                 xlinkHref)  
                                 
------------------------------------------------------------------------------
runButtonX : Int
runButtonX = 593

runButtonY : Int
runButtonY = 385

runButtonW : Int
runButtonW = 40

runButtonH : Int
runButtonH = 40

runButtonDraw : List (Svg msg)                                                  
runButtonDraw =                                                                 
  [ image                                                                   
      [ x ((toString runButtonX) ++ "px")                                                            
      , y ((toString runButtonY) ++ "px")                                                             
      , width  ((toString runButtonW) ++ "px")                                          
      , height ((toString runButtonH) ++ "px")                                          
      , xlinkHref ("../img/elements/run.png")                                 
      ]                                                                       
      []                                                                      
  ]                                                                             
------------------------------------------------------------------------------              

------------------------------------------------------------------------------
fastRunButtonX : Int                                                                
fastRunButtonX = runButtonX - 103
                                                                                
runFastButtonDraw : List (Svg msg)                                                    
runFastButtonDraw =                                                                   
  [ image                                                                   
      [ x ((toString fastRunButtonX) ++ "px")
      , y ((toString runButtonY) ++ "px")                                                             
      , width  ((toString runButtonW) ++ "px")
      , height ((toString runButtonH) ++ "px")
      , xlinkHref ("../img/elements/runFast.png")                             
      ]                                                                       
      []                                                                      
  ]                                                                             
------------------------------------------------------------------------------

------------------------------------------------------------------------------
{--
quesButtonX : Int                                                                
quesButtonX = runButtonX + 102
                                                                                
quesButtonY : Int                                                                
quesButtonY = runButtonY
                                                                                
quesButtonW : Int                                                                
quesButtonW = 50
                                                                                
quesButtonH : Int                                                                
quesButtonH = 50

quesButtonDraw : List (Svg msg)                                                 
quesButtonDraw =                                                                
  [ image                                                                   
      [ x ((toString quesButtonX) ++ "px")                                                             
      , y ((toString quesButtonY) ++ "px")                                                             
      , width  ((toString quesButtonW) ++ "px")                                           
      , height ((toString quesButtonH) ++ "px")                                         
      , xlinkHref ("../img/elements/ques.png")   
      ]                                                                       
      []                                                                      
  ]
------------------------------------------------------------------------------

------------------------------------------------------------------------------
helpMsgX : Int
helpMsgX = 25 

helpMsgY : Int
helpMsgY = 15

helpMsgW : Int
helpMsgW = 474
  
helpMsgH : Int
helpMsgH = 80

helpMsgDraw : String -> List (Svg msg)                                          
helpMsgDraw hmsg =                                                              
  [ image                                                                  
      [ x ((toString helpMsgX) ++ "px")                                                              
      , y ((toString helpMsgY) ++ "px")                                                              
      , width ((toString helpMsgW) ++ "px")                                          
      , height ((toString helpMsgH) ++ "px")                                          
      , xlinkHref (hmsg)                                                      
      ]                                                                       
      []                                                                      
  ]
--}
------------------------------------------------------------------------------

------------------------------------------------------------------------------
levelLabelX : Int
levelLabelX = runButtonX + 84

levelLabelY : Int
levelLabelY = runButtonY + 36

levelDraw : Int -> Int -> List (Svg msg)                                        
levelDraw level max =                                                           
  [ text'
      [ x ((toString levelLabelX) ++ "px")                                                            
      , y ((toString levelLabelY) ++ "px")                                  
      , fontStyle "italic"                                                    
      , fontSize "30px"                                                       
      ]                                                                       
      [ text ((toString level) ++ "/" ++ (toString max)) ]                
  ]
