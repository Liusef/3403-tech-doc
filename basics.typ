
#let sectctr = counter("mycounter")
#let pgctr = counter("values")

#let typ_rgb = rgb("258a98")
#let latex = box(image("assets/latex.svg", height: 13pt), height: 9pt)
#let typst = box(image("assets/typst_filled.svg", height: 11pt), height: 7.6pt)

#page(
  background: rect(
    fill: gradient.linear(rgb(24, 210, 182), rgb("3d98bb"), angle: 45deg), 
    height: 100%, 
    width: 100%
  ),
  [
    #align(
      horizon,
      [
        #image("assets/typst.svg", width: 60%)
        #text("COMPOSE DOCUMENTS\nFASTER.", size: 8mm, weight: "semibold", fill: white, tracking: 1mm, font: "Avenir Next LT Pro")
      ]
    )
    #align(
      bottom,
      [
        #line(length: 100%, stroke: white)
        #text("A quick start guide for users switching from LaTeX or Microsoft Word.", fill: white, font: "Aganè S", size: 13pt)
      ]
    )
  ]
  
)

#set text(font: "Aganè", tracking: -.25pt, fill: black.lighten(20%))
// #set text(font: "Avenir Next LT Pro")
// #set text(font: "Helvetica Neue")
// #set text(font: "DIN 2014")
// #set text(font: "Graphik")
// #set text(font: "Linux Libertine")
// #set text(font: "New Computer Modern")

#show raw: set text(font: "Cascadia Mono PL", weight: "regular")

#let pagetitle(intext, count) = {
  if count {
    [
    #box(height: 8mm, [
      #circle(fill: typ_rgb, radius: 4.5mm,[
        #align(center+horizon,[
            #text(sectctr.display(), size: 6mm, weight: "bold", fill: white)
        ])
        ])
    ]) #h(2mm) #text(
      intext, weight: 800, size: 1cm, fill: typ_rgb, tracking: -1pt
    )
    #v(4mm)
    ]
    sectctr.step()
  } else {
    [
    #text(
      intext, weight: 800, size: 1cm, fill: typ_rgb, tracking: -1pt
    )
    #v(1mm)
    ]
  }
  
}

#let uri(url, vis) = {
  link(url, text(vis, fill: typ_rgb))
}

#set page(
  background: [
    #rect(
      fill: gradient.linear(rgb(24, 180, 182), rgb("3d98bb"), angle: 45deg), 
      height: 120%, 
      width: 100%
    )
    #v(-31.5cm) 
    #stack( dir: ltr,
      box(width: 2.5cm),
      rect(
        fill: white, radius: 7mm,
        height: 100%,
        width: 100%,
      )
    )
    #align(bottom+left,  
      [  
        #pgctr.step()
        #rotate( 90deg, 
          [
            #h(17.5mm)
            #image("assets/typst.svg", height: -7.6mm)
          ]
        )
        #h(0.5cm)
        #text(pgctr.display(), fill: white, font: "Aganè")
        #v(1cm)
        
      ]
    )
  ]
)


#page(

background: [
    #rect(
      fill: gradient.linear(rgb(24, 180, 182), rgb("3d98bb"), angle: 45deg), 
      height: 120%, 
      width: 100%
    )
    #v(-27cm) 
    #stack( dir: ltr,
      box(width: 2.5cm),
      rect(
        fill: white, radius: 7mm,
        height: 100%,
        width: 100%,
      )
    )
    #align(bottom+left,  
      [  
        #pgctr.step()
        #rotate( 90deg, 
          [
            #h(17.5mm)
            #image("assets/typst.svg", height: -7.6mm)
          ]
        )
        #h(0.5cm)
        #text(pgctr.display(), fill: white, font: "Aganè")
        #v(1cm)
        
      ]
    )
  ],

  [

#v(-.75cm)
#text(
  "Welcome to typst !", weight: 800, size: 1.3cm, fill: white, tracking: -1pt, font: "Linux Libertine",
)

#v(.25cm)

Typst is a powerful, flexible, and friendly typesetting tool for the modern era. Using the built in functions and layouts, the ecosystem of external packages, and the powerful scripting tools, Typst can be used for any documents of your choosing, including research papers, theses, essays, reports, memos, and more. 

= Why Typst?

For anyone who has used #latex in the past, after learning some of the basics, you'll feel right at home with Typst. However, Typst is faster to write, easier to read and debug, renders nearly instantly, and allows for real time collaboration with peers. 

Typst also benefits people who currently typeset documents using conventional visual editors like Microsoft Word or Google Docs. The powerful template system allows you focus on writing and lets Typst handle the formatting as you type. And like LaTeX, Typst outputs higher quality documents with better justification and layouts. 

= Who is this guide for?
Typst is an incredibly powerful piece of software with a rich featureset, limitless extensibility, and a plethora usecases. *However, the scope of this guide will be limited to basic features like simple typesetting and math/equations.* Someone who could find this document useful is a student or researcher who is frustrated with LaTeX and is looking for a better alternative for writing high quality documents.

Some of the topics this guide will cover include:
- Environment Setup
- Writing Basic Documents
- Math Mode 
- Basic Scripting
- Third Party Packages
- Templates

= Precautions and Safety Warning
*Typst is still pre-release software*. Not everything is working and there may be core functionality still missing from the software. Although I have had few issues with Typst, your mileage may vary. If you encounter issues or want to request new features, feel free to contact the developers on Discord or GitHub (links at the end of the document). 

If you use the online version of Typst, you will be sending possibly personally identifiable information to the maintainers of Typst. Typst uses opt-out trackers on its website. Typst uses Microsoft Azure for content distribution and your information may be logged by Microsoft. Typst is compliant with the EU's GDPR and California's CCPA data privacy laws.  

If you use the offline version of Typst, you will need to download possible unstable software onto your computer. By using an offline version of Typst, you assume all risks. 

  ]
)



#pagebreak()
#pagetitle("Environment Setup", true)

There are a few ways that you can get started with Typst. 

= Web Editor 
#grid(
  columns: (2fr, 1fr), gutter: 5mm,
  [
    For a hassle free experience, use the online editor! 

    == Pros of the Web Editor
    - No hassle setup 
    - Automatic updates
    - Live updating and recompiling
    - Real time collaboration

  ],
  align(right, image(
    "assets/setup/web.png", 
    height: 4cm, width: 4.5cm
  ))
)

#grid(
  columns: (1fr, 1fr), [
    == Getting Started 

    Getting started on the web editor is as easy as going to #uri("https://typst.app/", "typst.app") and signing up for an account! Once you're there, you can work on projects, collaborate with teams, and create whatever you want with Typst!
  ],
  align(right, [
    #let s_vs_i_h = 3.5cm
    #let s_vs_i_w = 7cm
    #stack(
    spacing: -s_vs_i_h - 5pt,
    image(
      "assets/setup/webhome.jpg", 
      height: s_vs_i_h, width: s_vs_i_w
    ),
    box(
      height: s_vs_i_h + 10pt,
      width: s_vs_i_w + 4pt,
      radius: 16pt,
      stroke: 10pt + white, 
    ),
  )
  ])
)

= Visual Studio Code + Typst LSP
Using Vscode with the Typst LSP is as easy as the online editor with more flexibility!

#grid(
  columns: (auto, auto), gutter: 5mm,
  [
    == Pros of VSCode + Typst LSP
    - Quick Setup
    - Familiar Environment
    - Fast, offline compilation
    - Use local resources like fonts

    To get started with Typst in Visual Studio Code, just install the "Typst LSP" extension and a PDF extension of your choice. Then create a ```bash .typ``` file and start writing!
  ],
  [
    #image(
      "assets/setup/vsext.png"
    )
    #let s_vs_i_h = 4.5cm
    #let s_vs_i_w = 8cm
    #stack(
    spacing: -s_vs_i_h - 5pt,
    image(
      "assets/setup/vscode.png", 
      height: s_vs_i_h, width: s_vs_i_w
    ),
    box(
      height: s_vs_i_h + 10pt,
      width: s_vs_i_w + 4pt,
      radius: 16pt,
      stroke: 10pt + white, 
    ),
  )
  ]
)

#v(-1cm)
= Other Options
There are other options for setting up a development environment for typst as well! 

Quarto, an open source scientific and technical publishing system, now supports typst as an input format. 

Additionally, the Typst CLI (found at #uri("https://github.com/typst/typst", "github.com/typst/typst")) allows you to use typst with any text editor of your choosing!


#let typ_ex(height, input, content) = {
    [
      #v(2mm)
      #grid(
        columns: (1fr, 1fr), gutter: 5mm,
        rect(
          width: 100%, height: height, fill: rgb("293035"), radius: 2mm,
          grid(
            columns: (1.5mm, 1fr, 1.5mm),
            box(),
            [
              #v(1mm)
              #text(font: "Cascadia Code PL", weight: "bold", fill: blue.lighten(50%), "your_doc.typ")
              #v(-1.8mm)
              #line(length: 100%, stroke: white)
              #v(-1mm)
              #show raw: set text(fill: white)
              #raw(input, lang: "typst")
            ],
            box()
          )
        ),
        rect(width: 100%, height: height, 
          grid(
            columns: (1.5mm, 1fr, 1.5mm),
            box(),
            [
              #v(1mm)
              #text(weight: "extrabold", tracking: 1pt, fill: typ_rgb, "OUTPUT", size: 12pt) 
              #v(-2.5mm)
              #line(length: 100%)
              #v(-1mm)
              #set text(size: 10pt, font: "Linux Libertine")
              #content
            ],
            box()
          )
        )
      )
    ]
}


#pagebreak()
#pagetitle("The Basics", true)

Basic text entry in Typst is just like typing in Word. If you type text into a blank typst file, it will render that text onto a blank document (like a pdf). 
#typ_ex(
  2.5cm, 
  "Hello! This is a blank typst document with some text in it. ",
  [Hello! This is a blank typst document with some text in it.]
)

= Text Formatting
For formatting, Typst uses formatting similar to *Markdown*, a lightweight markup language. If you've used markdown or other markdown like editors (usually found in messaging applications), you'll feel right at home with Typst. If not, there are a few simple rules for formatting in Typst. 

The main ones to remember are:
- Use \*s to make text *Bold*
- Use \_ to make text #text("Oblique", style: "italic", font: "Frutiger Neue LT W1G Book") 
- Use \= to create headers of different sizes!
- \- to make Bulleted lists 
- \+ to make Numbered Lists
- Wrap text in \`s to make a code block!
  - Wrap text with 3 \`\`\`s and write the name of a language right after for syntax highlighting! (eg. #raw("```rust /* rust code here */ ```", lang: "md"))


#typ_ex(
  6.4cm,
  "Wrap text with \* to make it *Bold* \
Wrap text with \_ to make it _Oblique_\
Wrap with \` to make it `a code block`

= Large Header 
// add '='s for smaller headers
== Smaller Header 

- Bulleted List Item 
+ Numbered List Item  

Use the '\\\' character for line breaks
", 
  [
    Wrap text with \* to make it *Bold* \
    Wrap text with \_ to make it _Oblique_ \
    Wrap with \` to make it `a code block`

    = Large Header // add '='s for smaller headers
    #v(-2mm)
    == Smaller Header 

    - Bulleted List Item
    + Numbered List Item    

    Use the '\\' character for line breaks
    
  ]
)

#pagebreak()
#pagetitle("Math Input", true)

One of the major draws of Typst is it's strong but simple math input functionality. Users coming from Word may be familiar with how slow inputting math can be, and people switching from LaTeX are well aware of how messy TeX code can get with complex equations. 

In Typst, there are two types of math blocks. Inline and Blocks. Both are created by wrapping text with `$`'s. However, blocks have whitespace between the `$` and the start of the math code. 

#typ_ex(
  3.8cm,
  "There's *inline math*: 
$nabla dot bold(E) = rho/epsilon_0$ \

$ bold(\"Block Math\") \"is centered.\"\
nabla times bold(B) = mu_0 (bold(J) + epsilon_0 frac(diff bold(E), diff t)) $",
  [
    There's *inline math*: $nabla dot bold(E) = rho/epsilon_0$ \
    
    $ 
    bold("Block Math") "is centered."\
    nabla times bold(B) = mu_0 (bold(J) + epsilon_0 frac(diff bold(E), diff t))
    $
  ]
)

=== Additional Syntax
Compared to Word and LaTeX, writing math code in Typst is a little different, but after learning some of the basic syntax, you'll be on your way to typesetting math in typst like a pro!


#let typ_demo(width, title, code, cont) = {
  [
    #rect( width: width, stroke: 1pt, radius: 6pt,
      grid(
        columns: (2mm, auto, 2mm),
        box(),
        [
          #v(2mm)
          #align(center, text(fill: typ_rgb, weight: "bold", title))
          #v(-3mm)
          #line(length: 100%)
          #v(-1mm)
          #grid(
            columns: (1fr,0mm, 1fr),
            align(center,raw(code, lang: "typst")),
            $arrow.r$,
            align(center, cont )
          )
          #v(2mm)
        ], box()
      )
    )
  ]
}

#let tdlw(width, lw, title, code, cont) = {
  [
    #rect( width: width, stroke: 1pt, radius: 6pt,
      grid(
        columns: (2mm, auto, 2mm),
        box(),
        [
          #v(2mm)
          #align(center, text(fill: typ_rgb, weight: "bold", title))
          #v(-3mm)
          #line(length: 100%)
          #v(-1mm)
          #grid(
            columns: (lw,0mm, 1fr),
            align(center,raw(code, lang: "typst")),
            $arrow.r$,
            align(right, cont )
          )
          #v(2mm)
        ], box()
      )
    )
  ]
}


  #grid( columns: (auto, auto, auto), gutter: 3mm,
    typ_demo(4.7cm, "Sub / Superscripts", " $x^u_d$ ", $x^u_d$),
    typ_demo(3.5cm, "Fractions", "$1/x$", $1/x$),
    typ_demo(7cm, "Greek Symbols", "$sigma$ $Sigma$", $sigma #h(2mm) Sigma$)
  )
  #v(-2mm)
  #grid( columns: (auto, auto), gutter: 3mm,
    typ_demo(6cm, "Some Shorthands", "$ => != >=$", $=> #h(2mm) != #h(2mm) >=$),
    tdlw(9.5cm, 3fr, "Special Characters (See Docs for more)", "$arrow.l.curve integral.cont$", $arrow.l.curve #h(4mm) integral.cont$)
  )
  #v(-2mm)
  #grid( columns: (auto, auto), gutter: 3mm,
    tdlw(6.5cm, 1.5fr, "Text in Math", "$x_0 \"Text!\" x_1$", $x_0 "Text!" x_1$),
    tdlw(9cm, 2.68fr, "Math Functions", "$floor(x), frac(X, z*y), sqrt(9)$", $floor(x), frac(X, z*y), sqrt(9)$)
  )

=== Aligning
Use the `&` character to align math on different lines! This is good for if you're showing many different steps on different lines.
#v(-4mm)
#typ_ex(
  3.5cm,
  "Use & to align lines in block math:
$
nabla times D &= & &rho_v \
nabla times H &= &(diff D)/(diff t) + &J
$

",
  [
    Use & to align lines in block math:
    $
    nabla times D &= & &rho_v \
    nabla times H &= &(diff D)/(diff t) + &J
    $
  ]
)

#pagebreak()
#pagetitle("Scripting", true)

One of Typst's headlining features is the built in scripting features. Typst's scripting features allow you to automate repetitive tasks like layouting. Typst has lots of built in functions for layouting and visualization. Some of these include `text()` for rendering special text, `align()` for aligning content, `page()` for making special pages in your document, and many more! 

Typst also includes functionality specifically for scripting and calculations. Some of these include control flow constructs like loops, conditionals, and others! Typst also has lots of built-in functions like `range()`, `zip()`, and `map()` which behaves like Python's range, zip, and map functions. 

One sample usecase for the scripting is working on a tedious mathematical problem. You can write code that both does all the calculations for the problem while also generating code that shows all of your work!

#typ_ex(
  5.1cm,
  "#let factorial(n) = {\n\tlet curr = 1\n\tfor val in range(1, n+1) {\n\t\tlet prod = curr * val\n\t\t[ Round #val: $curr*val=prod$ \ ]\n\t\tcurr = prod\n\t}\n}
#factorial(8)",
  [
    #let factorial(n) = {
      let curr = 1
      for val in range(1, n+1) {
        let prod = curr * val
        [Round #val:#h(2mm) $curr * val = prod$\ ]
        curr = prod
      }
    }
    #factorial(8)
  ]
)

\

Learn more about scripting in Typst at #uri("https://typst.app/docs/reference/scripting/","typst.app/docs/reference/scripting")


#pagebreak()
#pagetitle("Templates", true)

"Templates" include a few different features within Typst. 

You can create templates using scripting functions that apply certain styles and layouts automatically. This allows you to focus on writing and lets you make changes to the template that apply across the whole document. 

Here's a basic example of a template!

#v(-2.2mm)

#typ_ex(
  4cm,
  "// Example from typst docs
#let amazed(term) = box[✨ #term ✨]

You are #amazed[beautiful]!",
  [
    #let amazed(term) = box[✨ #term ✨]

    You are #amazed[beautiful]!
  ]
)

Templates can do as little or as much as you want them to! The only limitations on what you can do are the Typst scripting language and ✨ Your Imagination ✨

=== Separate Files

You can also create separate files for templates that can define the visual style of your document, how the text flows on the page, different graphic elements on the page, page numbers, and more! One place this would be useful would be if you need to follow a specific format for a document. Examples of this would be if a specific conference needs a paper to include certain visual elements, or if you need to follow an organizational template. 

#let imdesc(imgp, desc) = {
  align(center,
  [
    #image(imgp) 
    #text(desc, fill: gray)
  ]
  )
}

#grid(
  columns: (1fr, 1fr, 1fr),
  imdesc("assets/template/ieee.png", "IEEE Format"),
  imdesc("assets/template/oxford.png", "Oxford Format"),
  imdesc("assets/template/mdpi.png", "MDPI Format")
)

#v(3mm)

Typst maintains a small repository of provided templates here #uri("https://github.com/typst/templates", "github.com/typst/templates")


Learn more about templates at #uri("https://typst.app/docs/tutorial/making-a-template", "typst.app/docs/tutorial/making-a-template").

#pagebreak()
#pagetitle("Third Party Packages", true)

Typst has a strong ecosystem of 3rd party packages that extend the core functionality of Typst with even more features. You can browse and learn how to install packages at #uri("https://typst.app/docs/packages/", "typst.app/docs/packages"). 

John Gosset also maintains a github repository containing a list of cool and helpful typst tools! Some things on there include chatbots for rendering typst code, typst extensions for other editors, templates for other formats and conferences, resume templates, formatting libraries, and even solutions for leetcode problems written with the typst scripting language! Check out the repo here: #uri("https://github.com/qjcg/awesome-typst", "github.com/qjcq/awesome-typst")

A package that students, engineers, and scientists alike may find useful is *Fletcher*, a package for making charts and diagrams. Here's an example of using fletcher: 

#typ_ex(
  10cm,
"#import \"@preview/fletcher:0.4.2\" as fletcher: node, edge

// https://xkcd.com/1195/
#import fletcher.shapes: diamond
#set text(font: \"Comic Neue\", weight: 600)
$
#fletcher.diagram(\n\tnode-stroke: 1pt,\n\tedge-stroke: 1pt,\n\tnode((0,0), [Start], corner-radius: 2pt, extrude: (0, 3)),\n\tedge(\"-|>\"),\n\tnode((0,1), align(center)[\n\t\tHey,\ this flowchart\ is a trap!\n\t], shape: diamond),\n\tedge(\"d,r,u,l\", \"-|>\", [Yes], label-pos: 0.1)
)
$",
  [
    #import "@preview/fletcher:0.4.2" as fletcher: node, edge

    // https://xkcd.com/1195/
    #import fletcher.shapes: diamond
    #set text(font: "Comic Neue", weight: 600)
    $
    #fletcher.diagram(
      node-stroke: 1pt,
      edge-stroke: 1pt,
      node((0,0), [Start], corner-radius: 2pt, extrude: (0, 3)),
      edge("-|>"),
      node((0,1), align(center)[
        Hey,\ this flowchart\ is a trap!
      ], shape: diamond),
      edge("d,r,u,l", "-|>", [Yes], label-pos: 0.1)
    )
    $
  ]
)

This example was borrowed from the documentation for fletcher: #uri("https://github.com/Jollywatt/typst-fletcher","github.com/Jollywatt/typst-fletcher")



#page(
  background: rect(
    fill: gradient.linear(rgb(14, 190, 152), rgb("2d78ab"), angle: 45deg), 
    height: 100%, 
    width: 100%
  ),
  align(horizon ,[
    #let alt_uri(lk, sh) = {
      box( height: 7pt,
        rect( height: 14pt, fill: white, radius: 2pt,
          uri(lk, sh)
        )
      )
    }
    #let bau(label, lk, sh) = {
      box( height: 1cm,
        rect( height: 12mm, fill: white, radius: 2pt,
          align(left,
          [
            
            #text(label, fill: black.lighten(40%)) 
            #v(-4.5mm)
            #link(lk, text(sh, fill: typ_rgb, size: 5mm, weight: "bold"))
          
          ])
        )
      )
    }
    #align(left, 
    [
      #pgctr.step()
      #text("WHAT'S NEXT FOR ", font: "Avenir Next LT Pro", size: 2cm, weight: "bold", fill: white) #text("typst ", font: "Linux Libertine", size: 2cm, weight: "bold", fill: white, tracking: -2pt) #text("?", font: "Avenir Next LT Pro", size: 2cm, weight: "bold", fill: white)
      #v(1cm)
    ]
    )
    #set text(fill: white, size: 12pt)
    Typst is still in beta and is getting new updates as we speak! To learn more about Typst, find more packages, or learn more about the features or Syntax of typst, visit the *Typst Docs* at #alt_uri("https://typst.app/docs", "typst.app/docs")!

    There's also a community Discord Server and a GitHub page if you want to speak to the developers! For example, if you're facing an issue with Typst, have a question on how to accomplish a task, or want to request a feature, join the open Typst Discord Server or leave an issue on the Typst GitHub page.

    #v(1cm)

    #align( right, 
      align(
        left, 
        [
          #box(image("assets/doc.png", width: 1.2cm)) #h(5mm) #bau("Read the docs", "https://typst.app/docs", "typst.app/docs")

          #box(image("assets/discord.svg", width: 1.2cm)) #h(5mm) #bau("Join the Discord", "https://discord.gg/2uDybryKPe", "discord.gg/2uDybryKPe")

          #box(image("assets/github.svg", width: 1.2cm)) #h(5mm) #bau("Check out the GitHub", "https://github.com/typst/", "github.com/typst")

          #box(image("assets/github.svg", width: 1.2cm)) #h(5mm) #bau("Awesome Typst Projects!", "https://github.com/qjcg/awesome-typst", "github.com/qjcq/awesome-typst")

          #box(image("assets/github.svg", width: 1.2cm)) #h(5mm) #bau("Source code for this doc", "https://github.com/Liusef/3403-tech-doc", "github.com/Liusef/3403-tech-doc")
        ]
      )
    )
    #align(
      bottom+left,
      [
        #image("assets/typst.svg", width: 10%)
        #v(-4mm)
        #text("Compose Documents Faster.", size: 2mm, weight: "regular", fill: white, font: "Avenir Next LT Pro", tracking: 1pt)
      ]
    )
  ])
)


#pagebreak()
#pagetitle("References", false)

- Typst GmbH. (2024). Typst. Typst. #link("https://typst.app")
- Typst GmbH. (2024). The Typst Tutorial. Typst. #link("https://typst.app/docs/tutorial")
- The LaTeX Project. (2024). LaTeX. The LaTeX Project. #link("https://www.latex-project.org/")
- Microsoft Corp. (2024). Microsoft 365. Microsoft Corp. #link("https://microsoft365.com/")
- Alphabet Inc. (2024). Google Docs. Alphabet Inc. #link("https://docs.google.com")
- Microsoft Corp. (2024). Microsoft Azure. Microsoft Corp. #link("https://azure.microsoft.com/")
- European Union. (2018). General Data Protection Reg. European Union. #link("https://gdpr.eu/")
- State of California. (2018). California Consumer Privacy Act. California Department of Justice, Office of the Attorney General. #link("https://www.oag.ca.gov/privacy/ccpa")
- Typst GmbH. (2024). Typst Live Collaboration Graphic. Typst. #link("https://typst.app")
- Microsoft Corp. (2024). GitHub. Microsoft Corp. #link("https://github.com/")
- Typst GmbH. (2024). Typst Homepage. Typst. #link("https://typst.app/home")
- Microsoft Corp. (2024). Visual Studio Code. Microsoft Corp. #link("https://code.visualstudio.com/")
- Microsoft Corp. (2024). Microsoft Windows. Microsoft Corp. #link("https://windows.com/")
- Nathan Varner. (2024). Typst Language Server Protocol. Nathan Varner. #link("https://github.com/nvarner/typst-lsp")
- Microsoft Corp. (2024). Visual Studio Marketplace. Microsoft Corp. #link("https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp")
- Quarto. (2024). Quarto. Quarto. #link("https://quarto.org/")
- Rust Foundation. (2024). Rust Lang. Rust Foundation. #link("https://rust-lang.org/")
- Python Software Foundation. (2024). the Python programming language. Python Software Foundation. #link("https://python.org/")
- Typst GmbH. (2024). Typst Package Repository. Typst. #link("https://github.com/typst/packages")
- John Gosset. (2024). Awesome Typst. John Gosset. #link("https://github.com/qjcg/awesome-typst")
- Joseph Wilson. (2024). Fletcher. Jollywatt. #link("https://github.com/Jollywatt/typst-fletcher")
- Randall Munroe. (2024). XKCD. Randall Munroe. #link("https://xkcd.com/")
- Typst Gmbh. (2024). Typst Templates for IEEE, Oxford, MDPI. Typst. #link("https://typst.app/")
- Institute of Electrical and Electronics Engineers. (2024). IEEE. Institute of Electrical and Electronics Engineers. #link("https://www.ieee.org")
- Oxford University. (2024). Oxford University Press. Oxford University. #link("https://corp.oup.com")
- Multidisciplinary Digital Publishing Institute. (2024). MDPI. Multidisciplinary Digital Publishing Institute. #link("https://mdpi.com/")
- Typst GmbH. (2024). Typst Documentation. Typst. #link("https://typst.app/docs")
- Typst GmbH. (2024). Typst Privacy Policy. Typst. #link("https://typst.app/privacy/")
- Discord Inc. (2024). Discord. Discord Inc. #link("https://discord.com/")
- Microsoft Corp. (2021). Cascadia Code. Microsoft Corp.
- Microsoft Corp. (2021). Fluent Emojis. Microsoft Corp.
- Microsoft Corp. (2024). Fluent Design System. Microsoft Corp. 
- Danillo De Marco. (2017). The Aganè Font Family. Danillo De Marco.
- Adrian Frutiger. (2015). Avenir Next. Adrian Frutiger. 
- Adrian Frutiger. (2015). Neue Frutiger. Adrian Frutiger. 
- Libertine Open Fonts Project. (2012). Linux Libertine. Libertine Open Fonts Project.


#page(
  background: rect(
    fill: gradient.linear(rgb(24, 210, 182), rgb("3d98bb"), angle: 135deg), 
    height: 100%, 
    width: 100%
  ),
  [
    #align(
      top+right,
      [
        #image("assets/typst.svg", width: 20%)
        #v(-2mm)
        #text("Compose Documents Faster.", size: 4mm, weight: "regular", fill: white, font: "Avenir Next LT Pro")
      ]
    )
    #align(
      bottom,
      [
        #line(length: 100%, stroke: white)
        // #v(-1cm)
        #align(center,[
          #text("This document was typset in", fill: white) #text("typst", font: "Linux Libertine", weight: "bold", fill: white)
        ])
      ]
    )
  ]
  
)