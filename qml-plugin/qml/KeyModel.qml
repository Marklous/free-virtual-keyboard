import QtQuick 2.0

Item {
    property QtObject firstRowModel: firstEnglish
    property QtObject secondRowModel: secondEnglish
    property QtObject thirdRowModel: thirdEnglish

    property QtObject languagesModel: languages

    function switchToLanguage(language) {


        if (language === "de") {
            firstRowModel = firstDeutsch
            secondRowModel = secondDeutsch
            thirdRowModel = thirdDeutsch
        } else if (language === "fr") {
            firstRowModel = firstFrancais
            secondRowModel = secondFrancais
            thirdRowModel = thirdFrancais
        } else if (language === "it") {
            firstRowModel = firstItaliano
            secondRowModel = secondItaliano
            thirdRowModel = thirdItaliano
        } else if (language === "es") {
            firstRowModel = firstSpanish
            secondRowModel = secondSpanish
            thirdRowModel = thirdSpanish
        }  else if (language === "pt") {
            firstRowModel = firstPortuguese
            secondRowModel = secondPortuguese
            thirdRowModel = thirdPortuguese
        } else { // english is backup
            firstRowModel = firstEnglish
            secondRowModel = secondEnglish
            thirdRowModel = thirdEnglish
        }
    }

    ListModel {
        id:languages
        ListElement {identifier: "de" ; name: "Deutsch"        ; shortcut: "Deutsch" }
        ListElement {identifier: "en" ; name: "British English"; shortcut: "English" }
        ListElement {identifier: "fr" ; name: "Français"       ; shortcut: "Français"}
        ListElement {identifier: "it" ; name: "Italiano"       ; shortcut: "Italiano"}
        ListElement {identifier: "es" ; name: "Español"        ; shortcut: "Español"}
        ListElement {identifier: "pt" ; name: "Português"     ; shortcut: "Português"}
    }

    ListModel {
        id:firstEnglish
        ListElement { letter: "q"; firstSymbol: "1"; secondSymbol: "~"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "w"; firstSymbol: "2"; secondSymbol: "`"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "e"; firstSymbol: "3"; secondSymbol: "|"; secondAlternativeSymbols: ""; alternativeLetters: "êëèé" }
        ListElement { letter: "r"; firstSymbol: "4"; secondSymbol: "·"; secondAlternativeSymbols: ""; alternativeLetters: "ŕř" }
        ListElement { letter: "t"; firstSymbol: "5"; secondSymbol: "√"; secondAlternativeSymbols: ""; alternativeLetters: "ţŧť" }
        ListElement { letter: "y"; firstSymbol: "6"; secondSymbol: "÷"; secondAlternativeSymbols: ""; alternativeLetters: "ÿýŷ" }
        ListElement { letter: "u"; firstSymbol: "7"; secondSymbol: "×"; secondAlternativeSymbols: ""; alternativeLetters: "űūũûüùú" }
        ListElement { letter: "i"; firstSymbol: "8"; secondSymbol: "½"; secondAlternativeSymbols: "¼⅓½¾⅞"; alternativeLetters: "îïīĩìí" }
        ListElement { letter: "o"; firstSymbol: "9"; secondSymbol: "{"; secondAlternativeSymbols: ""; alternativeLetters: "œøõôöòó" }
        ListElement { letter: "p"; firstSymbol: "0"; secondSymbol: "}"; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:secondEnglish
        ListElement { letter: "a"; firstSymbol: "@"; secondSymbol: "$"; secondAlternativeSymbols: ""; alternativeLetters: "äåãâàá" }
        ListElement { letter: "s"; firstSymbol: "#"; secondSymbol: "€"; secondAlternativeSymbols: ""; alternativeLetters: "šşś" }
        ListElement { letter: "d"; firstSymbol: "%"; secondSymbol: "£"; secondAlternativeSymbols: ""; alternativeLetters: "đď" }
        ListElement { letter: "f"; firstSymbol: "&"; secondSymbol: "¢"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "g"; firstSymbol: "*"; secondSymbol: "¥"; secondAlternativeSymbols: ""; alternativeLetters: "ġģĝğ" }
        ListElement { letter: "h"; firstSymbol: "-"; secondSymbol: "="; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "j"; firstSymbol: "+"; secondSymbol: "§"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "k"; firstSymbol: "("; secondSymbol: "["; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "l"; firstSymbol: ")"; secondSymbol: "]"; secondAlternativeSymbols: ""; alternativeLetters: "ĺŀłļľ" }
    }       

    ListModel {
        id:thirdEnglish
        ListElement { letter: "z"; firstSymbol: "!" ; secondSymbol: "_"; secondAlternativeSymbols: ""; alternativeLetters: "žż" }
        ListElement { letter: "x"; firstSymbol: "\""; secondSymbol: '™'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "c"; firstSymbol: "<" ; secondSymbol: '®'; secondAlternativeSymbols: ""; alternativeLetters: "çċčć" }
        ListElement { letter: "v"; firstSymbol: ">" ; secondSymbol: '«'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "b"; firstSymbol: "'" ; secondSymbol: '»'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "n"; firstSymbol: ":" ; secondSymbol: '“'; secondAlternativeSymbols: ""; alternativeLetters: "ņńň" }
        ListElement { letter: "m"; firstSymbol: ";" ; secondSymbol: '”'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: ","; firstSymbol: "/" ; secondSymbol: "\\";secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "."; firstSymbol: "?" ; secondSymbol: "^"; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ////////////////////////////////////////////////////////

    ListModel {
        id:firstDeutsch
        ListElement { letter: "q"; firstSymbol: "1"; secondSymbol: "~"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "w"; firstSymbol: "2"; secondSymbol: "`"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "e"; firstSymbol: "3"; secondSymbol: "|"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "r"; firstSymbol: "4"; secondSymbol: "·"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "t"; firstSymbol: "5"; secondSymbol: "√"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "y"; firstSymbol: "6"; secondSymbol: "÷"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "u"; firstSymbol: "7"; secondSymbol: "×"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "i"; firstSymbol: "8"; secondSymbol: "½"; secondAlternativeSymbols: "¼⅓½¾⅞"; alternativeLetters: "" }
        ListElement { letter: "o"; firstSymbol: "9"; secondSymbol: "{"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "p"; firstSymbol: "0"; secondSymbol: "}"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "ü"; firstSymbol: ""; secondSymbol: ""  ; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:secondDeutsch
        ListElement { letter: "a"; firstSymbol: "@"; secondSymbol: "$"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "s"; firstSymbol: "#"; secondSymbol: "€"; secondAlternativeSymbols: ""; alternativeLetters: "ß" }
        ListElement { letter: "d"; firstSymbol: "%"; secondSymbol: "£"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "f"; firstSymbol: "&"; secondSymbol: "¢"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "g"; firstSymbol: "*"; secondSymbol: "¥"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "h"; firstSymbol: "-"; secondSymbol: "="; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "j"; firstSymbol: "+"; secondSymbol: "§"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "k"; firstSymbol: "("; secondSymbol: "["; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "l"; firstSymbol: ")"; secondSymbol: "]"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "ö"; firstSymbol: ""; secondSymbol: ""  ; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "ä"; firstSymbol: ""; secondSymbol: ""  ; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:thirdDeutsch
        ListElement { letter: "z"; firstSymbol: "!" ; secondSymbol: "_"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "x"; firstSymbol: "\""; secondSymbol: '™'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "c"; firstSymbol: "<" ; secondSymbol: '®'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "v"; firstSymbol: ">" ; secondSymbol: '«'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "b"; firstSymbol: "'" ; secondSymbol: '»'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "n"; firstSymbol: ":" ; secondSymbol: '“'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "m"; firstSymbol: ";" ; secondSymbol: '”'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: ","; firstSymbol: "/" ; secondSymbol: "\\";secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "."; firstSymbol: "?" ; secondSymbol: "^"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "-"; firstSymbol: "" ; secondSymbol: ""  ; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ////////////////////////////////////////////////////////

    ListModel {
        id:firstFrancais
        ListElement { letter: "a"; firstSymbol: "1"; secondSymbol: "~"; secondAlternativeSymbols: ""; alternativeLetters: "àâæ" }
        ListElement { letter: "z"; firstSymbol: "2"; secondSymbol: "`"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "e"; firstSymbol: "3"; secondSymbol: "|"; secondAlternativeSymbols: ""; alternativeLetters: "éèêë" }
        ListElement { letter: "r"; firstSymbol: "4"; secondSymbol: "·"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "t"; firstSymbol: "5"; secondSymbol: "√"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "y"; firstSymbol: "6"; secondSymbol: "÷"; secondAlternativeSymbols: ""; alternativeLetters: "ÿ" }
        ListElement { letter: "u"; firstSymbol: "7"; secondSymbol: "×"; secondAlternativeSymbols: ""; alternativeLetters: "ùûü" }
        ListElement { letter: "i"; firstSymbol: "8"; secondSymbol: "½"; secondAlternativeSymbols: "¼⅓½¾⅞" ; alternativeLetters: "îï" }
        ListElement { letter: "o"; firstSymbol: "9"; secondSymbol: "{"; secondAlternativeSymbols: ""; alternativeLetters: "ôœ" }
        ListElement { letter: "p"; firstSymbol: "0"; secondSymbol: "}"; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:secondFrancais
        ListElement { letter: "q"; firstSymbol: "@"; secondSymbol: "$"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "s"; firstSymbol: "#"; secondSymbol: "€"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "d"; firstSymbol: "%"; secondSymbol: "£"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "f"; firstSymbol: "&"; secondSymbol: "¢"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "g"; firstSymbol: "*"; secondSymbol: "¥"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "h"; firstSymbol: "-"; secondSymbol: "="; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "j"; firstSymbol: "+"; secondSymbol: "§"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "k"; firstSymbol: "("; secondSymbol: "["; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "l"; firstSymbol: ")"; secondSymbol: "]"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "m"; firstSymbol: ""; secondSymbol: ""  ; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:thirdFrancais
        ListElement { letter: "w"; firstSymbol: "!" ; secondSymbol: "_"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "x"; firstSymbol: "\""; secondSymbol: '™'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "c"; firstSymbol: "<" ; secondSymbol: '®'; secondAlternativeSymbols: ""; alternativeLetters: "ç" }
        ListElement { letter: "v"; firstSymbol: ">" ; secondSymbol: '«'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "b"; firstSymbol: "'" ; secondSymbol: '»'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "n"; firstSymbol: ":" ; secondSymbol: '“'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: ","; firstSymbol: "/" ; secondSymbol: "\\";secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "."; firstSymbol: "?" ; secondSymbol: "^"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "-"; firstSymbol: "" ; secondSymbol: ""  ; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ////////////////////////////////////////////////////////

    ListModel {
        id:firstItaliano
        ListElement { letter: "q"; firstSymbol: "1"; secondSymbol: "~"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "w"; firstSymbol: "2"; secondSymbol: "`"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "e"; firstSymbol: "3"; secondSymbol: "|"; secondAlternativeSymbols: ""; alternativeLetters: "èé" }
        ListElement { letter: "r"; firstSymbol: "4"; secondSymbol: "·"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "t"; firstSymbol: "5"; secondSymbol: "√"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "y"; firstSymbol: "6"; secondSymbol: "÷"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "u"; firstSymbol: "7"; secondSymbol: "×"; secondAlternativeSymbols: ""; alternativeLetters: "ùú" }
        ListElement { letter: "i"; firstSymbol: "8"; secondSymbol: "½"; secondAlternativeSymbols: "¼⅓½¾⅞" ; alternativeLetters: "ìí" }
        ListElement { letter: "o"; firstSymbol: "9"; secondSymbol: "{"; secondAlternativeSymbols: ""; alternativeLetters: "òó" }
        ListElement { letter: "p"; firstSymbol: "0"; secondSymbol: "}"; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:secondItaliano
        ListElement { letter: "a"; firstSymbol: "@"; secondSymbol: "$"; secondAlternativeSymbols: ""; alternativeLetters: "àá" }
        ListElement { letter: "s"; firstSymbol: "#"; secondSymbol: "€"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "d"; firstSymbol: "%"; secondSymbol: "£"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "f"; firstSymbol: "&"; secondSymbol: "¢"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "g"; firstSymbol: "*"; secondSymbol: "¥"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "h"; firstSymbol: "-"; secondSymbol: "="; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "j"; firstSymbol: "+"; secondSymbol: "§"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "k"; firstSymbol: "("; secondSymbol: "["; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "l"; firstSymbol: ")"; secondSymbol: "]"; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:thirdItaliano
        ListElement { letter: "z"; firstSymbol: "!" ; secondSymbol: "_"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "x"; firstSymbol: "\""; secondSymbol: '™'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "c"; firstSymbol: "<" ; secondSymbol: '®'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "v"; firstSymbol: ">" ; secondSymbol: '«'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "b"; firstSymbol: "'" ; secondSymbol: '»'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "n"; firstSymbol: ":" ; secondSymbol: '“'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "m"; firstSymbol: ";" ; secondSymbol: '”'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: ","; firstSymbol: "/" ; secondSymbol: "\\";secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "."; firstSymbol: "?" ; secondSymbol: "^"; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ////////////////////////////////////////////////////////

    ListModel {
        id:firstSpanish
        ListElement { letter: "q"; firstSymbol: "1"; secondSymbol: "~"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "w"; firstSymbol: "2"; secondSymbol: "`"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "e"; firstSymbol: "3"; secondSymbol: "|"; secondAlternativeSymbols: ""; alternativeLetters: "ēęėëêèeé" }
        ListElement { letter: "r"; firstSymbol: "4"; secondSymbol: "·"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "t"; firstSymbol: "5"; secondSymbol: "√"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "y"; firstSymbol: "6"; secondSymbol: "÷"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "u"; firstSymbol: "7"; secondSymbol: "×"; secondAlternativeSymbols: ""; alternativeLetters: "üûùú" }
        ListElement { letter: "i"; firstSymbol: "8"; secondSymbol: "½"; secondAlternativeSymbols: "¼⅓½¾⅞" ; alternativeLetters: "ïįîìí" }
        ListElement { letter: "o"; firstSymbol: "9"; secondSymbol: "{"; secondAlternativeSymbols: ""; alternativeLetters: "öõôòóº" }
        ListElement { letter: "p"; firstSymbol: "0"; secondSymbol: "}"; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:secondSpanish
        ListElement { letter: "a"; firstSymbol: "@"; secondSymbol: "$"; secondAlternativeSymbols: ""; alternativeLetters: "äãâàáª" }
        ListElement { letter: "s"; firstSymbol: "#"; secondSymbol: "€"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "d"; firstSymbol: "%"; secondSymbol: "£"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "f"; firstSymbol: "&"; secondSymbol: "¢"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "g"; firstSymbol: "*"; secondSymbol: "¥"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "h"; firstSymbol: "-"; secondSymbol: "="; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "j"; firstSymbol: "+"; secondSymbol: "§"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "k"; firstSymbol: "("; secondSymbol: "["; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "l"; firstSymbol: ")"; secondSymbol: "]"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "ñ"; firstSymbol: ""; secondSymbol: ""; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:thirdSpanish
        ListElement { letter: "z"; firstSymbol: "!" ; secondSymbol: "_"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "x"; firstSymbol: "\""; secondSymbol: '™'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "c"; firstSymbol: "<" ; secondSymbol: '®'; secondAlternativeSymbols: ""; alternativeLetters: "čçć" }
        ListElement { letter: "v"; firstSymbol: ">" ; secondSymbol: '«'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "b"; firstSymbol: "'" ; secondSymbol: '»'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "n"; firstSymbol: ":" ; secondSymbol: '“'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "m"; firstSymbol: ";" ; secondSymbol: '”'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: ","; firstSymbol: "/" ; secondSymbol: "\\";secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "."; firstSymbol: "?" ; secondSymbol: "^"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "-"; firstSymbol: "" ; secondSymbol: ""; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ////////////////////////////////////////////////////////

    ListModel {
        id:firstPortuguese
        ListElement { letter: "q"; firstSymbol: "1"; secondSymbol: "~"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "w"; firstSymbol: "2"; secondSymbol: "`"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "e"; firstSymbol: "3"; secondSymbol: "|"; secondAlternativeSymbols: ""; alternativeLetters: "ēęėëêèé" }
        ListElement { letter: "r"; firstSymbol: "4"; secondSymbol: "·"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "t"; firstSymbol: "5"; secondSymbol: "√"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "y"; firstSymbol: "6"; secondSymbol: "÷"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "u"; firstSymbol: "7"; secondSymbol: "×"; secondAlternativeSymbols: ""; alternativeLetters: "üûùú" }
        ListElement { letter: "i"; firstSymbol: "8"; secondSymbol: "½"; secondAlternativeSymbols: "¼⅓½¾⅞" ; alternativeLetters: "ïįîìí" }
        ListElement { letter: "o"; firstSymbol: "9"; secondSymbol: "{"; secondAlternativeSymbols: ""; alternativeLetters: "öõôòó" }
        ListElement { letter: "p"; firstSymbol: "0"; secondSymbol: "}"; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:secondPortuguese
        ListElement { letter: "a"; firstSymbol: "@"; secondSymbol: "$"; secondAlternativeSymbols: ""; alternativeLetters: "äãâàá" }
        ListElement { letter: "s"; firstSymbol: "#"; secondSymbol: "€"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "d"; firstSymbol: "%"; secondSymbol: "£"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "f"; firstSymbol: "&"; secondSymbol: "¢"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "g"; firstSymbol: "*"; secondSymbol: "¥"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "h"; firstSymbol: "-"; secondSymbol: "="; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "j"; firstSymbol: "+"; secondSymbol: "§"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "k"; firstSymbol: "("; secondSymbol: "["; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "l"; firstSymbol: ")"; secondSymbol: "]"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "ç"; firstSymbol: "" ; secondSymbol: "" ; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ListModel {
        id:thirdPortuguese
        ListElement { letter: "z"; firstSymbol: "!" ; secondSymbol: "_"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "x"; firstSymbol: "\""; secondSymbol: '™'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "c"; firstSymbol: "<" ; secondSymbol: '®'; secondAlternativeSymbols: ""; alternativeLetters: "čć" }
        ListElement { letter: "v"; firstSymbol: ">" ; secondSymbol: '«'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "b"; firstSymbol: "'" ; secondSymbol: '»'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "n"; firstSymbol: ":" ; secondSymbol: '“'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "m"; firstSymbol: ";" ; secondSymbol: '”'; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: ","; firstSymbol: "/" ; secondSymbol: "\\";secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "."; firstSymbol: "?" ; secondSymbol: "^"; secondAlternativeSymbols: ""; alternativeLetters: "" }
        ListElement { letter: "-"; firstSymbol: "" ; secondSymbol: ""; secondAlternativeSymbols: ""; alternativeLetters: "" }
    }

    ////////////////////////////////////////////////////////

}
