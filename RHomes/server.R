library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, sessions) {

  output$ukmap <- renderLeaflet({
    
    if(input$render_map == 0){return()}
    
    isolate({
    
      map_style <- input$select_map
      
      leaflet() %>% 
        addProviderTiles(map_style) %>% 
        setView(lat = 54.347028, lng = -2.133141, 
                zoom = 6)
      
    })
    
  })
  
})
