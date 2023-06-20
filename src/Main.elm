module Main exposing (..)

import Browser
import Element
import Element.Background
import Element.Font
import Element.Input
import Element.Border


main =
    Browser.sandbox
        { init = farbendunkel
        , view = viewLayout
        , update = update
        }
   
type Msg
    = MsgChangeColors



update msg model = 
    
    if model.primary == farbendunkel.primary then
        farben
    else
        farbendunkel 
farben =
        { secondary = Element.rgb255 168 158 78
    , secondaryLight = Element.rgb255 122 122 173
    , secondaryDark = Element.rgb255 26 55 92
    , primary = Element.rgb255 136 197 100
    , primaryLight = Element.rgb255 241 247 243
    , primaryDark = Element.rgb255 12 9 83
    , textOnSecondary = Element.rgb255 0 0 1
    , textOnPrimary = Element.rgb255 0xFF 0xFF 0xFF
        }

farbendunkel =
    { primary = Element.rgb255 168 158 78
    , primaryLight = Element.rgb255 122 122 173
    , primaryDark = Element.rgb255 26 55 92
    , secondary = Element.rgb255 136 197 100
    , secondaryLight = Element.rgb255 241 247 243
    , secondaryDark = Element.rgb255 12 9 83
    , textOnPrimary = Element.rgb255 0x00 0x00 0x00
    , textOnSecondary = Element.rgb255 0xFF 0xFF 0xFF
    }
    
bild1 = Element.image [ Element.width Element.fill, Element.paddingEach { top = 200, right = 0, bottom = 2000, left = 0 } ]
        { src = "KarteDarkmode.jpg"
        , description = "Ein Bild einer Karte"
        }

bild2 = Element.image [ Element.width Element.fill, Element.paddingEach { top = 200, right = 0, bottom = 2000, left = 0 } ]
        { src = "Karte.png"
        , description = "Ein Bild einer Karte"

    }


ueberschriftFont =
    Element.Font.family [ Element.Font.typeface "UeberschriftFont" ]


textFont =
    Element.Font.family [ Element.Font.typeface "TextFont" ]


viewLayout model =
    Element.layoutWith
        { options = [
            Element.focusStyle {
                backgroundColor = Nothing
                , borderColor = Just model.primaryDark
                , shadow = Nothing
            }
        ]
        }
        [ Element.Background.color model.secondaryDark
        , Element.padding 15 
        , Element.Font.color model.textOnSecondary
        ]
        (Element.column []
            [ buttonDarkmode model, viewTitel model
            , viewParagraph model
            , viewText
            , bild1
            ]
        
        )


viewTitel model =
    Element.paragraph
        [ Element.Font.center
        , Element.Font.color model.primary
        , ueberschriftFont
        , Element.Font.size 150
        ]
        [ Element.text "Weltuhr"
        ]


viewParagraph model =
    Element.paragraph [ Element.Font.color model.primaryLight, textFont, Element.Font.size 100 ]
        [ Element.text "Test mit anderer Schriftart"
        ]




abschnitt1 =
    "Zeitzonen sind geografisch definierte Bereiche auf der Erde, in denen die gleiche Standardzeit gilt. Die Welt ist in insgesamt 24 Hauptzeitzonen unterteilt, wobei jede Zone etwa 15 Längengrade umfasst. Die Koordinierte Weltzeit (UTC) bildet die Grundlage für die Einteilung der Zeitzonen. Die meisten Länder haben ihre Standardzeit in einer bestimmten Zeitzonen festgelegt, um eine einheitliche Zeitmessung innerhalb ihres Territoriums sicherzustellen. Durch die Einteilung in Zeitzonen wird die Zeitübertragung und Koordination von globalen Aktivitäten wie Handel, Kommunikation und Reisen erleichtert."


abschnitt2 =
    "Die Zeitverschiebung zwischen verschiedenen Zeitzonen ergibt sich aus den unterschiedlichen Längengraden, die von den Zeitzonen abgedeckt werden. Die Erde dreht sich in 24 Stunden einmal um ihre Achse, was bedeutet, dass pro Stunde etwa 15 Grad (360 Grad ÷ 24 Stunden) durchlaufen werden. Wenn wir uns von einer Zeitzone zur nächsten bewegen, ändert sich die Standardzeit um etwa eine Stunde. Wenn es beispielsweise in einer bestimmten Zeitzone 12:00 Uhr mittags ist, kann es in der angrenzenden Zeitzone 13:00 Uhr sein. Diese Stunde Differenz in der Zeit wird als Zeitverschiebung bezeichnet."


abschnitt3 =
    "Die Zeitverschiebung kann verschiedene Auswirkungen haben. Für Reisende bedeutet sie, dass sie ihre Uhren anpassen müssen, um den lokalen Zeitrahmen des Zielorts einzuhalten. Dies kann sich auf den Schlaf-Wach-Rhythmus und das allgemeine Wohlbefinden auswirken, da der Körper Zeit braucht, um sich an die neue Zeitzone anzupassen. Die Zeitverschiebung spielt auch eine wichtige Rolle in der globalen Kommunikation und Geschäftstätigkeit. Bei internationalen Meetings oder Konferenzen müssen die Teilnehmer die Zeitverschiebung berücksichtigen, um sicherzustellen, dass alle zum richtigen Zeitpunkt anwesend sind. Darüber hinaus kann die Zeitverschiebung auch den Handel und die Finanzmärkte beeinflussen, da die Öffnungs- und Schließzeiten von Börsen und Geschäften von den lokalen Zeitzonen abhängig sind."

buttonDarkmode model =
    Element.Input.button[
        Element.Background.color model.primaryLight
        , Element.Border.rounded 8
        , Element.Font.color model.secondaryDark
        , Element.alignRight
        , Element.paddingEach { top=12,right=12,bottom=9,left=12}
        , Element.Font.size 16
        , Element.Font.bold
        , Element.mouseOver[
            Element.Background.color model.primary
        ]
    ]
        { onPress = Just MsgChangeColors
        ,label = Element.text "DarkMode"}
viewText =
    Element.column []
        [ Element.paragraph [] [ Element.text abschnitt1 ]
        , Element.paragraph [] [ Element.text abschnitt2 ]
        , Element.paragraph [] [ Element.text abschnitt3 ]
        ]
