# Repository-Richtlinien

## Projektstruktur & Modulorganisation
Dieses Repository ist ein kleines Buch-/Manuskriptprojekt mit flacher Struktur. Die Quellkapitel liegen im Repository-Wurzelverzeichnis als Markdown-Dateien wie `00_buch.md`, `01_gruenes_Licht.md` und `02_business_case.md`. Charakter- oder Referenznotizen verwenden das Muster `99_*.md`. Zu den Build-Eingaben gehört auch [`theory.lua`](/home/goz1sh/buch/theory.lua), das als Lua-Filter an Pandoc übergeben wird. Generierte Artefakte werden im Wurzelverzeichnis abgelegt, etwa `buch.tex`, `buch.pdf` und temporäre LaTeX-Dateien wie `*.aux` und `*.log`.

## Build-, Test- und Entwicklungsbefehle
Verwende `make` oder `make all`, um das Manuskript vollständig zu bauen. Dabei wird Pandoc auf alle `*.md`-Dateien angewendet, `buch.tex` erzeugt und anschließend `buch.pdf` zweimal mit `xelatex` kompiliert, damit Inhaltsverzeichnis und Referenzen stabil sind.

Verwende `make clean`, um Zwischenprodukte von LaTeX zu entfernen und die PDF zu behalten. Verwende `make distclean`, um sowohl Zwischenprodukte als auch `buch.pdf` zu löschen.

Beispiel:

```sh
make
make clean
```

## Schreibstil & Benennungskonventionen
Halte Markdown-Dateien schlicht und gut lesbar. Verwende klare Abschnittsüberschriften, kurze Abschnitte und konsistente Markdown-Syntax. Behalte die numerischen Dateipräfixe bei, weil der Build Shell-Expansion über `*.md` verwendet; die Reihenfolge wird durch die Dateinamen bestimmt. Folge dem bestehenden Benennungsschema:

- Hauptkapitel: `00_*.md`, `01_*.md`
- Referenz-/Persona-Dateien: `99_*.md`

Lua-Änderungen in `theory.lua` sollten minimal bleiben und sich auf die Logik der Dokumenttransformation konzentrieren.

Verwende normale Anführungszeichen und Bindestriche; Pandoc übernimmt die Umwandlung.

Setze typografische Hervorhebungen in Markdown mit `_..._` oder `*...*`, nicht mit Apostrophen oder einfachen Anführungszeichen. Apostrophe erzeugen keine echte Auszeichnung und können im PDF ungünstig umbrechen.

Das Projekt ist als serielles Management-Sachbuch in Romanform angelegt: ein Fortsetzungs-Bildungsroman für Managerinnen und Manager, die beim Lesen unterhalten werden und zugleich etwas lernen wollen. Schreibe in einem Stil, der Jane Austen ähnelt: Figuren interagieren über Dialoge, soziale Beobachtung und feine Machtverschiebungen treiben die Handlung voran. Der Protagonist lernt Management nicht abstrakt, sondern durch Irrtum, Beschämung, Beobachtung, Konflikt und spätere Reflexion.

Verdichte Dialoge rhythmisch: Wenn eine Figur nur kurz reagiert und direkt spricht, kombiniere Handlung und wörtliche Rede nach Möglichkeit in einem Absatz. Vermeide das Muster `Person tut etwas.` als eigenen Absatz, gefolgt von einem Absatz, der nur aus wörtlicher Rede besteht. Nutze isolierte Redeabsätze nur, wenn die Pause, Betonung oder soziale Wirkung bewusst gesetzt werden soll.

Verwende Konstruktionen wie `nicht ... sondern ...` nur sparsam. Sie unterbrechen den erzählerischen Fluss schnell und wirken bei häufiger Nutzung belehrend. Formuliere Gegensätze nach Möglichkeit über Handlung, Dialog, konkrete Beobachtung oder einen glatteren Satzbau, statt sie schematisch gegeneinanderzustellen.

Neue Sub-Kapitel sollen als potenzielle wöchentliche LinkedIn-Folgen funktionieren. Jede Folge braucht:

- einen klaren erzählerischen Anlass oder Konflikt
- einen wiedererkennbaren Management-Lernpunkt
- genug Kontext, damit auch neue Leserinnen und Leser folgen können
- eine Szene, die durch Dialog und Verhalten trägt, nicht durch Erklärung
- einen kleinen Sog zum nächsten Konflikt, ohne künstlichen Cliffhanger

Denke beim Schreiben eher an einen modernen Fortsetzungsroman als an eine geschlossene Verlag-Leseprobe. Die bestehenden Kapitel müssen nicht rückwirkend umgebaut werden; neue Kapitel sollen aber stärker episodisch, wiederkehrbar und veröffentlichbar gedacht sein.

Am Ende größerer Kapitel oder sinnvoller Lernabschnitte gibt es einen Theorie-Teil, der reflektiert, was wir in diesem Abschnitt gelernt haben.

Theorie-Teile werden als `::: Theorie`-Boxen geschrieben. Sie sollen klar als Edutainment-Praxisboxen funktionieren: vom konkreten Szenenerlebnis zur anwendbaren Management-Methode. Verwende nach Möglichkeit diese Struktur:

- `**Was in der Szene passiert ist**`: kurzer Rückbezug auf die Handlung.
- `**Das Prinzip**`: knappe Erklärung des Konzepts.
- `**So wendest du es an**`: konkrete Schritte, Fragen oder Checkliste.
- `**Worauf du achten solltest**`: typische Fallen und Fehlannahmen.
- `**Merksatz**`: ein prägnanter Satz, der die Methode verdichtet.

Schlage dem Nutzer Änderungen immer zuerst vor, bevor du sie in eine Datei übernimmst, sofern nicht ausdrücklich etwas anderes verlangt wird.
