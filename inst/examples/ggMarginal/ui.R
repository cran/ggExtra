share <- list(
  title = "ggMarginal (from ggExtra package)",
  url = "https://daattali.com/shiny/ggExtra-ggMarginal-demo/",
  image = "https://daattali.com/shiny/img/ggmarginal.png",
  description = "Add marginal plots to ggplot2.",
  twitter_user = "daattali"
)

fluidPage(
  shinydisconnect::disconnectMessage2(),
  title = "ggMarginal - add marginal plots to ggplot2",
  tags$head(
    includeCSS(file.path('www', 'style.css')),

    # Favicon
    tags$link(rel = "shortcut icon", type="image/x-icon", href="https://daattali.com/shiny/img/favicon.ico"),

    # Facebook OpenGraph tags
    tags$meta(property = "og:title", content = share$title),
    tags$meta(property = "og:type", content = "website"),
    tags$meta(property = "og:url", content = share$url),
    tags$meta(property = "og:image", content = share$image),
    tags$meta(property = "og:description", content = share$description),

    # Twitter summary cards
    tags$meta(name = "twitter:card", content = "summary"),
    tags$meta(name = "twitter:site", content = paste0("@", share$twitter_user)),
    tags$meta(name = "twitter:creator", content = paste0("@", share$twitter_user)),
    tags$meta(name = "twitter:title", content = share$title),
    tags$meta(name = "twitter:description", content = share$description),
    tags$meta(name = "twitter:image", content = share$image)
  ),
  tags$a(
    href="https://github.com/daattali/ggExtra",
    tags$img(style="position: absolute; top: 0; right: 0; border: 0;",
             src="github-orange-right.png",
             alt="Fork me on GitHub")
  ),
  useShinyjs(),

  div(id = "header",
      div(id = "title",
          "ggMarginal"
      ),
      div(id = "subtitle",
          "Add marginal plots to ggplot2 (from ggExtra package)"),
      div(id = "subsubtitle",
          "By",
          tags$a(href = "https://deanattali.com/", "Dean Attali"),
          HTML("&bull;"),
          "Package available",
          tags$a(href = "https://github.com/daattali/ggExtra", "on GitHub"),
          HTML("&bull;"),
          tags$a(href = "https://daattali.com/shiny/", "More apps"), "by Dean"
      )
  ),

  div(id = "loading-content", h2("Loading...")),
  fluidRow(id = "app-content",
    column(3, wellPanel(
      class = "settings",
      h3(class = "settings-title", "Main plot"),
      selectInput("dataset", "Choose a dataset:", names(datasets)),
      uiOutput("x_var_select"),
      uiOutput("y_var_select"),
      uiOutput("col_var_select"),
      sliderInput("font_size", "Font size", 0, 50, 15, 1)
    )),

    column(3, wellPanel(
      class = "settings",
      h3(class = "settings-title", "Marginal plots"),
      checkboxInput("show_marginal", "Show marginal plots", TRUE),

      div(id = "marginal-settings",
        selectInput("type", NULL, c("density", "histogram", "boxplot", "violin", "densigram")),
        selectInput("margins", "Which margins?", c("both", "x", "y")),
        conditionalPanel(
          condition = "input.margins != 'y'",
          selectInput("xtrans", "X axis transformation", c("none", "log","reverse"))
        ),
        conditionalPanel(
          condition = "input.margins != 'x'",
          selectInput("ytrans", "Y axis transformation", c("none", "log","reverse"))
        ),
        checkboxInput("groupColour", "Show groups as 'colour'", FALSE),
        checkboxInput("groupFill", "Show groups as 'fill'", FALSE),
        sliderInput("size",
                    "Size ratio of main plot:marginal plots",
                    1, 5, 5, 0.5),
        colourpicker::colourInput("col", "Marginal plot colour", "red",
                                  showColour = "background", allowTransparent = TRUE),
        colourpicker::colourInput("fill", "Marginal plot fill colour", "orange",
                                  showColour = "background", allowTransparent = TRUE)
      )
    )),

    column(6,
      plotOutput("plot"),
      pre(id = "code")
    )
  )
)
