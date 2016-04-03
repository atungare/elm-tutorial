module Main (..) where

import Html exposing (Html)
import Html.Events as Events

view : Signal.Address String -> String -> Html
view address msg =
  Html.div
    []
    [ Html.div [] [ Html.text msg ]
    , Html.button
      [ Events.onClick address "Hello" ]
      [ Html.text "Click me" ]
    ]

mb : Signal.Mailbox String
mb = Signal.mailbox ""

main : Signal Html
main =
  Signal.map (view mb.address) mb.signal
