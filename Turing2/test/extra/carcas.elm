module   exposing (tests)                                             
                                                                                
import ElmTest exposing (..)                                                    
import Array exposing (fromList, empty)                                         
import Turing exposing (Machine, MachineCfg, TapeCfg, run)                      
                                                                                
                                                                                
--TEST DATA-------------------------------------------------------------------  
                                                                                
-- Test Data for tests (machine, transition table and input word)    



------------------------------------------------------------------------------  
------------------------------------------------------------------------------  
                                                                                
                                                                                
--HELPERS---------------------------------------------------------------------  
                                                                                
-- Common run function for all tests                                            
                                                                                
runRes : Machine Char Int -> List (Maybe Char) -> List (MachineCfg Char Int)    
runRes m inp =                                                                  
  let                                                                           
    init = (initMachineCfg m inp)                                               
  in                                                                            
    (run m init [init])                                                         
                                                                                
                                                                                
--HEAD------------------------------------------------------------------------    
                                                                                
-- Check the first MachineConfig in the list of configs                         

                                                                                
                                                                                
------------------------------------------------------------------------------   
------------------------------------------------------------------------------  
                                                                                
                                                                                
--MIDDLE----------------------------------------------------------------------  
                                                                                

                                                                                
------------------------------------------------------------------------------   
------------------------------------------------------------------------------  
                                                                                
                                                                                
--LAST------------------------------------------------------------------------  
                                                                                
-- Check the last MachineConfig in the list of configs                          
                                                                                

                                                                                
------------------------------------------------------------------------------   
------------------------------------------------------------------------------  
