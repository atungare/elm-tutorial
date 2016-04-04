module Main (..) where

import Html exposing (Html)
import Html.Events as Events

type alias Model = { count : Int }

type Action = NoOp | Increase

initialModel : Model
initialModel =
  { count = 0 }

view : Signal.Address Action -> Model -> Html
view address model =
  Html.div
    []
    [ Html.div [] [ Html.text (toString model.count) ]
    , Html.button
      [ Events.onClick address Increase ]
      [ Html.text "Click me" ]
    ]

update : Action -> Model -> Model
update action model =
  case action of
    Increase ->
      { model | count = model.count + 1 }
    NoOp ->
      model

mb : Signal.Mailbox Action
mb = Signal.mailbox NoOp

modelSignal : Signal.Signal Model
modelSignal =
  Signal.foldp update initialModel mb.signal

main : Signal Html
main =
  Signal.map (view mb.address) modelSignal
