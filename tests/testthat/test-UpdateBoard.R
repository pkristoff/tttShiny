# https://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf

# library(tttShiny)
print("test-updateboard")
# source("UpdateBoard.R")
# print("sourced")
context("UpdateBoard")
# print("contexted")

test_that("UpdateBoard works correctly.", {

  input = list(Cell_1_1_X=TRUE,Cell_1_1_O=FALSE,
            Cell_1_2_X=TRUE,Cell_1_2_O=FALSE,
            Cell_1_3_X=TRUE,Cell_1_3_O=FALSE,
            Cell_2_1_X=TRUE,Cell_2_1_O=FALSE,
            Cell_2_2_X=TRUE,Cell_2_2_O=FALSE,
            Cell_2_3_X=TRUE,Cell_2_3_O=FALSE,
            Cell_3_1_X=TRUE,Cell_3_1_O=FALSE,
            Cell_3_2_X=TRUE,Cell_3_2_O=FALSE,
            Cell_3_3_X=TRUE,Cell_3_3_O=FALSE
            )
  print(paste("input=", input$Cell_2_2_X))
  expect_that(UpdateBoard(input, xSide=1, oSide=-1))

})
