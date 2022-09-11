rm(list = ls()) # remove all current variables

library(magrittr)
library(shiny)
library(shinydashboard)

library(leaflet)

# header ------------------------------------------------------------------

header <- dashboardHeader(title = "RHouses UK")

# sidebar -----------------------------------------------------------------

sidebar <- dashboardSidebar( # sidebar tab information here
  sidebarMenu(
    menuItem("Map", tabName = "homemap", icon = icon("chart-area"), selected = TRUE)  
  )
)

# body --------------------------------------------------------------------

body <- dashboardBody( 
  tags$head(
    tags$style(HTML("
                    .content-wrapper {
                    background-color: white !important;
                    }
                    .body{
                    font-family: open sans;
                    }
                    .main-sidebar {
                    }
                    .irs-bar {background: #444; border: 1px solid #444;}
                    .irs-bar-edge {border: 1px solid #444; background: #444;}
                    .irs-single{background: #444;}
                    .irs-min, .irs-max{background: transparent;}
                    .irs-to, .irs-from{background: #444;}
                    ::selection {background: red;}
                    .nav-tabs-custom{box-shadow: 0 1px 1px rgba(0,0,0,.4);}
                    .nav-tabs-custom > .nav-tabs > li[class=active] {border-top-color: #444;}
                    .radio-bs-primary input[type='radio']:checked + label::before {border-color: #444 !important}
                    .radio-bs-primary input[type='radio'] + label::after, .radio-bs-primary input[type='radio']:checked + label::after {background-color: #444 !important}
                    .radio-bs label{text-align:left}
                    .progress-bar {background-color: #444 !important}
                    table.dataTable.hover tbody tr:hover, table.dataTable.display tbody tr:hover {
                                background-color: #444 !important; color: white;
                    }
                    button, input, optgroup, select, textarea {background-color: white;}
                    table.dataTable tr.selected td, table.dataTable td.selected {background-color: #444 !important; color: white;}
                    .box {box-shadow: 0 1px 2px rgba(0,0,0,.4);}
                    .btn-default {background-color: white;}")
    )
  ),
  
  tabItems(
    
    # tab item 1 - File Select --------------------------------------------------------------------
    tabItem(tabName = "homemap",
            
      fluidRow(align = 'center',
                 
        box(
          width = 10,
          leafletOutput("ukmap", height = 640)  
          
        )
      )     
    )
  )
)

ui <- dashboardPage(header, sidebar, body, skin = "black") # combine all parts, skin black makes top bar white
