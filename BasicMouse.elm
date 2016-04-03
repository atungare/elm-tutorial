module Main where

import Html exposing (Html)
import Mouse

view : Int -> Html
view = (toString >> Html.text)

main : Signal.Signal Html
main = Signal.map view Mouse.x
