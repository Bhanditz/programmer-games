module Main exposing (..)

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Html.App
import Mouse
import Collage exposing (..)
import Element
import Color exposing (..)
import Random


type alias Figure =
        { x : Int   -- coordinates of center (point of mouse click)
        , y : Int
        , n : Int   -- number of poligon`s sides
        , r : Int   -- radius for figure (from 20 to 100)
        , c : Color -- color of figure
        }


-- MODEL 
type alias Model =
        { currentN : Int          -- current value of n - number of sides 
        , currentR : Int          -- current value of radius
        , currentC : Color        -- current value of color
        , figures : List Figure   -- figures to draw 
        }


init : (Model, Cmd Msg)
init =
        (Model 3 20 red [] , Cmd.none)


-- MESSAGES 
type Msg
    = Decrement               -- button click messages 
    |Increment
    |MouseMsg Mouse.Position  -- mouse click message
    |NewRadius Int            -- random radius message


-- color of collage for drawing
clearGrey : Color.Color
clearGrey =
           Color.rgba 111 111 111 0.6


-- width and height of collage for drawing 
width : Float 
width = 1000 

height : Float
height = 1000


-- VIEW 
view : Model -> Html Msg
view model =
      div [] 
          [ button [ onClick Decrement ] [ Html.text "-" ]
          , div [] [ Html.text (toString model.currentN) ]
          , button [ onClick Increment ] [ Html.text "+" ]
          , collage     -- collage with squares of color      
               300 60 
               [ rect 40 40 
                   |> filled red 
               , rect 40 40 
                   |> filled green
                   |> move (60,0)
               , rect 40 40 
                   |> filled yellow 
                   |> move (120,0)
               ]
               |> Element.toHtml
          , collage     -- main collage for drawing
              (floor width) (floor height) 
              ( [rect width height |> filled clearGrey] ++
                (List.map (\f ->   -- draw all of figures 
                             ngon f.n (toFloat f.r) 
                               |> filled f.c 
                               |> move ( ((toFloat f.x) - width/2), (height/2 - (toFloat f.y) + 140) )
                          ) 
                          model.figures
                )
              )
              |> Element.toHtml
          ] 


-- UPDATE
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
        case msg of
           -- process button messages
           Decrement ->
               if model.currentN > 3 then ( { model | currentN = model.currentN - 1 }, Cmd.none )
               else ( model, Cmd.none )
           Increment ->
                if model.currentN < 12 then ( { model | currentN = model.currentN + 1 }, Cmd.none ) 
                else ( model, Cmd.none )
           -- process mouse message
           MouseMsg pos ->
                -- click color squares
                if pos.y >= 90 && pos.y <= 130 && pos.x >= 130 && pos.x < 170 then ( { model | currentC = red }, Cmd.none) 
                else if pos.y >= 90 && pos.y <= 130 && pos.x >= 190 && pos.x < 230 then ( { model | currentC = green }, Cmd.none)
                else if pos.y >= 90 && pos.y <= 130 && pos.x >= 250 && pos.x < 290 then ( { model | currentC = yellow }, Cmd.none)
                -- white area not for drawing
                else if pos.y <= 139 || pos.x > 1000 then ( model, Cmd.none ) 
                -- put new figure in list of figures for drawing (with random radius)
                else ( { model | figures = model.figures ++ [Figure pos.x pos.y model.currentN model.currentR model.currentC]}, Random.generate NewRadius (Random.int 20 100) )
           -- process message for generate new random radius
           NewRadius newR ->
                ( { model | currentR = newR }, Cmd.none)


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
     Mouse.clicks MouseMsg


-- MAIN
main : Program Never
main =
  Html.App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
