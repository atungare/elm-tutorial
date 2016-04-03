module Main (..) where

import Html exposing (Html)
import Mouse

view : Int -> Html
view = (toString >> Html.text)

countSignal : Signal Int
countSignal = Signal.foldp (\_ counter -> counter + 1) 0 Mouse.clicks

main : Signal.Signal Html
main = Signal.map view countSignal
