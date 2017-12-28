
#' the number of columns in the tic-tac-toe board
#'
#' @return Integer
#'
#' @examples
#' BoardSize()
#' @export
BoardSize <- function() {
  3
}

board.size = BoardSize()

#'
#'
#' @param localBoard: vector (1:9) - values for a cell: -1, 0, 1
#' @param disableWidget: Boolean
#'
#' @return
#'
#' @examples
#' DisableWholeBoard()
#' @export
DisableWholeBoard <- function(localBoard, disableWidget) {
  for (index in 1:9) {
    cells = tttShiny::UICellForIndex(index)
    if (disableWidget) {
      shinyjs::disable(cells[[1]])
      shinyjs::disable(cells[[2]])
    } else {
      shinyjs::enable(cells[[1]])
      shinyjs::enable(cells[[2]])
    }
  }
}

#' disables both checkboxes if cell has been played.
#' otherwise disable so one side (X,O) cannot play.
#'
#' @param localBoard: vector (1:9) - values for a cell: -1, 0, 1
#' @param computerSide: Integer: (1,-1)
#' @param xSide: Integer: (1,-1)
#' @param oSide: Integer: (1,-1)
#'
#' @return
#'
#' @examples
#' DisableBoard()
#' @export
DisableBoard <- function(localBoard, computerSide, xSide, oSide) {
  for (index in 1:9) {
    cells = tttShiny::UICellForIndex(index)
    if (localBoard[index] != 0) {
      shinyjs::disable(cells[[1]])
      shinyjs::disable(cells[[2]])
    } else
    if (computerSide == xSide) {
      shinyjs::disable(cells[[1]])
      shinyjs::enable(cells[[2]])
    } else if (computerSide == oSide) {
      shinyjs::enable(cells[[1]])
      shinyjs::disable(cells[[2]])
    }
  }
}

#' returns who has won if any one.
#'
#' @param board: 3x3 matrix representing board - values for a cell: -1, 0, 1
#'
#' @return Integer: -1 or 1, or 0 if no-one has won.
#'
#' @examples
#' EvaluateBoard()
#' @export
EvaluateBoard <- function(board) {

  FlipMatrix <- function(m) {
    apply(m, 2, rev)
  }
  sums <- c(colSums(board),
            rowSums(board),
            sum(diag(board)),
            sum(diag(FlipMatrix(board))))

  if (max(sums) == board.size) {
    return(1)
  }
  if (min(sums) == -board.size) {
    return(-1)
  }
  0
}

#' generates new tic-tac-toe board
#'
#' @examples
#' GenerateEmptyBoard()
#' @export
GenerateEmptyBoard <- function() {
  matrix(0, ncol = board.size, nrow = board.size)
}

#' returns whether are any moves left.
#'
#' @param board: 3x3 matrix representing board - values for a cell: -1, 0, 1
#'
#' @return Bollean: TRUE if some cells have 0 otherwise FALSE
#'
#' @examples
#' EvaluateBoard()
#' @export
IsMovePossible <- function(board) {
  length(which(board == 0)) > 0
}

#' shiny ui for a tic-tac-toe game
#'
#' @param input
#'        xSide
#'        oSide
#'
#' @examples
#' shinyTTTUI()
#' @export
UpdateBoard <- function(input, xSide=-999, oSide=999) {
  GetSide <- function(isX, isY) {
    if (isX) {
      xSide
    } else if (isY)
    {
      oSide
    } else{
      0
    }
  }
  reactive({
    board <- GenerateEmptyBoard()
    board[[1]] <- GetSide(input$Cell_1_1_X, input$Cell_1_1_O)
    board[[4]] <- GetSide(input$Cell_1_2_X, input$Cell_1_2_O)
    board[[7]] <- GetSide(input$Cell_1_3_X, input$Cell_1_3_O)
    board[[2]] <- GetSide(input$Cell_2_1_X, input$Cell_2_1_O)
    board[[5]] <- GetSide(input$Cell_2_2_X, input$Cell_2_2_O)
    board[[8]] <- GetSide(input$Cell_2_3_X, input$Cell_2_3_O)
    board[[3]] <- GetSide(input$Cell_3_1_X, input$Cell_3_1_O)
    board[[6]] <- GetSide(input$Cell_3_2_X, input$Cell_3_2_O)
    board[[9]] <- GetSide(input$Cell_3_3_X, input$Cell_3_3_O)
    board
  })
}


#' converts index on the board to a list representing the
#' X and O checkboxes for the cell.
#'
#' @param index: integer 1:9
#'
#' @return list with checkbox names for cell.
#'
#' @examples
#' UICellForIndex()
#' @export
UICellForIndex <- function(index) {
  switch(
    index,
    list("Cell_1_1_X", "Cell_1_1_O"),
    list("Cell_2_1_X", "Cell_2_1_O"),
    list("Cell_3_1_X", "Cell_3_1_O"),
    list("Cell_1_2_X", "Cell_1_2_O"),
    list("Cell_2_2_X", "Cell_2_2_O"),
    list("Cell_3_2_X", "Cell_3_2_O"),
    list("Cell_1_3_X", "Cell_1_3_O"),
    list("Cell_2_3_X", "Cell_2_3_O"),
    list("Cell_3_3_X", "Cell_3_3_O"),
    list("Unknown Cell X", "Unknown Cell O")
  )
}

#' updates UI side with serverside move
#'
#' @param localBoard: vector (1:9) - values for a cell: -1, 0, 1
#' @param move: Integer: (-1, 0, 1)
#' @param side: Integer: (-1, 1)
#' @param xSide: Integer: (-1, 1)
#' @param session: shiny session
#'
#' @return list with checkbox names for cell.
#'
#' @examples
#' UpdateInputForMove()
#' @export
UpdateInputForMove <- function(localBoard, move, side, xSide, session) {
  if (side == xSide) {
    cellIndex <- 1
    labelText <- "X"
  } else {
    cellIndex <- 2
    labelText <- "O"
  }
  cell <- UICellForIndex(move)[[cellIndex]]
  updateCheckboxInput(session, cell, label = labelText, value = TRUE)
}
