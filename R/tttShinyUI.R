
# install.packages("shiny")
library(shiny)
# install.packages("shinyjs")
library(shinyjs)



#' shiny ui for a tic-tac-toe game
#'
#' @examples
#' shinyTTTUI()
#' @export
shinyTTTUI <- function () {
  cbCol1 <- 3
  cbCol2 <- 3
  cbCol3 <- 3
  pageWithSidebar(
    headerPanel("Tic Tac Toe"),

    sidebarPanel(shinyjs::useShinyjs(),
                 fixedRow(
                   column(
                     9,
                     style = "background-color:pink;",
                     fixedRow(
                       column(
                         cbCol1,
                         style = "background-color:aqua;",
                         checkboxInput("Cell_1_1_X", "X", FALSE),
                         checkboxInput("Cell_1_1_O", "O", FALSE)
                       )
                       ,
                       column(
                         cbCol2,
                         style = "background-color:aqua;",
                         checkboxInput("Cell_1_2_X", "X", FALSE),
                         checkboxInput("Cell_1_2_O", "O", FALSE)
                       )
                       ,
                       column(
                         cbCol3,
                         style = "background-color:aqua;",
                         checkboxInput("Cell_1_3_X", "X", FALSE),
                         checkboxInput("Cell_1_3_O", "O", FALSE)
                       )
                     ),
                     fixedRow(
                       column(
                         cbCol1,
                         style = "background-color:aqua;",
                         checkboxInput("Cell_2_1_X", "X", FALSE),
                         checkboxInput("Cell_2_1_O", "O", FALSE)
                       )
                       ,
                       column(
                         cbCol2,
                         style = "background-color:aqua;",
                         checkboxInput("Cell_2_2_X", "X", FALSE),
                         checkboxInput("Cell_2_2_O", "O", FALSE)
                       )
                       ,
                       column(
                         cbCol3,
                         style = "background-color:aqua;",
                         checkboxInput("Cell_2_3_X", "X", FALSE),
                         checkboxInput("Cell_2_3_O", "O", FALSE)
                       )
                     ),
                     fixedRow(
                       column(
                         cbCol1,
                         style = "background-color:aqua;",
                         checkboxInput("Cell_3_1_X", "X", FALSE),
                         checkboxInput("Cell_3_1_O", "O", FALSE)
                       )
                       ,
                       column(
                         cbCol2,
                         style = "background-color:aqua;",
                         checkboxInput("Cell_3_2_X", "X", FALSE),
                         checkboxInput("Cell_3_2_O", "O", FALSE)
                       )
                       ,
                       column(
                         cbCol3,
                         style = "background-color:aqua;",
                         checkboxInput("Cell_3_3_X", "X", FALSE),
                         checkboxInput("Cell_3_3_O", "O", FALSE)
                       )
                     )
                   )
                 )),

    mainPanel(fixedRow(
      column(
        12,
        #style = "background-color:pink;",
        fixedRow(column(3, style = "background-color:aqua;", uiOutput('board'))),
        fixedRow(column(3, style = "background-color:aqua;", textOutput('xWinsText'))),
        fixedRow(column(3, style = "background-color:aqua;", textOutput('oWinsText'))),
        fixedRow(column(3, style = "background-color:aqua;", textOutput('tiesText'))),
        fixedRow(column(
          3, style = "background-color:aqua;", actionButton("startNewGame", "Start New Game")
        ))
      )
    ))
  )
}
