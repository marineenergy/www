library(shiny)

ui <- fluidPage(
    
    # unrelated to main question but why doesn't hover change color?
    
    mainPanel(
        # create a div called all_circles
        # I want to use this like a selectInput, where the svgs can be clicked
        div(id="all_circles", uiOutput("svgout")),
        div(id="all_sqaures",
            div(class = "sqaures", style = "width:100%;overflow:hidden;",
                div(class = "square", style = "height:80px;width:80px;background-color:red;padding:10px;margin:10px;border: solid 3px black;float:left;", `data-value` = "red"),
                div(class = "square", style = "height:80px;width:80px;background-color:blue;margin:10px;border: solid 3px black;float:left;", `data-value` = "blue"),
                div(class = "square", style = "height:80px;width:80px;background-color:yellow;margin:10px;border: solid 3px black;float:left;", `data-value` = "yellow")
            )
        )
    ),
    verbatimTextOutput("debug_circles"),
    verbatimTextOutput("debug"),
    
    
    # this works when using divs!
    tags$script(HTML(
        # find the class square that was clicked on within all_sqaures
        # set input$all_sqaures == the clicked square
        "$('#all_sqaures').on('click', '.square', (ev) => {
        console.log({id: '#all_sqaures', value: ev.target.dataset.value})
        Shiny.setInputValue('all_squares', ev.target.dataset.value)
        })
        "
    )),
    
    
    # can I do the same thing with SVGs?
    tags$script(HTML(
        "$('#all_circles').on('click', '.circ', (ev) => {
        console.log({id: '#all_circles', value: ev.target.id})
        Shiny.setInputValue('all_circles', ev.target.id)
        })
        "
    )),
    
    
    tags$style(HTML("
                    .square:hover {
                    background-color: black;
                    }
                    "))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    # print out the data-value of the clicked circle
    output$debug_circles <- renderPrint(input$all_circles)
    # this works!
    output$debug <- renderPrint(input$all_squares)
    
    
    output$svgout <- renderUI({
        HTML(
            "<svg data-value='red_circle' class='circ' height='100' width='100' xmlns='http://www.w3.org/2000/svg'>
        <circle id ='circ_red' cx='50' cy='50' r='40' stroke='black' stroke-width='3' fill='red'/>
      </svg>
      <svg data-value='blue_circle' id ='circ_blue' class='circ' height='100' width='100' xmlns='http://www.w3.org/2000/svg'>
        <circle id ='circ_blue' cx='50' cy='50' r='40' stroke='black' stroke-width='3' fill='blue' />
      </svg>
      <svg data-value='yellow_circle' id ='circ_yellow'class='circ' height='100' width='100' xmlns='http://www.w3.org/2000/svg'>
        <circle id ='circ_yellow' cx='50' cy='50' r='40' stroke='black' stroke-width='3' fill='yellow'/>
      </svg>"
        )
    })
}

# Run the application 
shinyApp(ui = ui, server = server)