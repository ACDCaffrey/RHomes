library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, sessions) {

  output$ukmap <- renderLeaflet({
    leaflet() %>% 
      addProviderTiles(providers$Esri.WorldImagery) %>% 
      setView(lat = 54.347028, lng = -2.133141, 
              zoom = 6)
  })
  
})
