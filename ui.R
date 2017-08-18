library(shiny)
library(shinydashboard)

dashboardPage(title = "PLP4",
              skin = ("blue"),
              dashboardHeader(title = HTML("<a style=color:white;  href=\"http://www.bancomer.com\">Nemo's App</a>"),#tags$a(href="https://www.bancomer.com/", "Nemo's App") ,#loadingLogo('https://www.bancomer.com/',
          
                              # Email Sharing link
                              tags$li(class = "dropdown",
                                      tags$a(href = "mailto:?Subject=Go Google Yourself&Body=Visualize the life you've build on Google's world... and let us suggest you one thing or two... ",
                                             tags$img(height = "18px", 
                                                      src = "images/email.png")
                                      )
                              ),
                              
                              # Twitter Sharing Link
                              tags$li(class = "dropdown",
                                      tags$a(href = "http://twitter.com/share?text=Go Google Yourself&Body=Visualize the life you've build on Google's world... and let us suggest you one thing or two... http://https://www.facebook.com/Go-google-yourself-1991980714370104/?ref=br_rs", 
                                             target = "_blank", 
                                             tags$img(height = "18px", 
                                                      src = "images/twitter.png")
                                      )
                              ),
                              
                              # Facebook Sharing link
                              tags$li(class = "dropdown",
                                      tags$a(href = "http://www.facebook.com/sharer.php?u=https://www.facebook.com/Go-google-yourself-1991980714370104/?ref=br_rs", 
                                             target = "_blank", 
                                             tags$img(height = "18px", 
                                                      src = "images/facebook.png")
                                      )
                              ),
                              
                              # LinkedIn Sharing link
                              tags$li(class = "dropdown",
                                      tags$a(href = "http://www.linkedin.com/shareArticle?mini=true&url=https://www.facebook.com/Go-google-yourself-1991980714370104/?ref=br_rs", 
                                             target = "_blank", 
                                             tags$img(height = "18px", 
                                                      src = "images/linkedin.png")
                                      )
                              )
              ),
              
              dashboardSidebar(
                # gaugeOutput("bbvab4",height='130px'),
                sidebarMenu(
                  menuItem("Registro", tabName = "regis", icon = icon("bank")),
                  menuItem("Carga de archivos", tabName = "datafile", icon = icon("database")),
                  menuItem("Estabilidad de la población", tabName = "psi", icon = icon("grav")),
                  menuItem("Poder discriminante", tabName = "gini", icon = icon("signal")),
                  menuItem("Gestión", tabName = "gest", icon = icon("volume-control-phone")),
                  # menuItem("Recommender", tabName = "recom", icon = icon("microphone")),
                  # menuItem("About", tabName = "about", icon = icon("info")),
                  hr(),
                  sidebarUserPanel(name = a("Milton's Team", target = "_blank_",
                                            href = "https://github.com/mexmet"), 
                                   subtitle = "Cracks 1",
                                   image = "images/milton.jpg"),
                  sidebarUserPanel(name = a("Ximena's Team", target = "_blank_",
                                            href = "https://github.com/mexmet"), 
                                   subtitle = "Cracks 2",
                                   image = "images/ximena.jpg"),
                  sidebarUserPanel(name = a("Pomare", target = "_blank_",
                                            href = "https://github.com/Omar333"), 
                                   subtitle = "Datasaientista",
                                   image = "images/omar.png"),
                  sidebarUserPanel(name = a("Paola", target = "_blank_",
                                            href = "https://github.com/paolamateos"), 
                                   subtitle = "SAS genius",
                                   image = "images/paola.png"),
                  hr(),
                  menuItem("Source code", icon = icon("file-code-o"), 
                           href = "https://github.com/mexmet/plp4"),
                  menuItem("Bug Reports", icon = icon("bug"),
                           href = "https://github.com/mexmet/plp4/issues")
                )
              ),
              
              dashboardBody(
                tags$head(includeScript("www/js/google-analytics.js"),
                          HTML('<link rel="apple-touch-icon" sizes="57x57" href="icons/apple-icon-57x57.png">
                               <link rel="apple-touch-icon" sizes="60x60" href="icons/apple-icon-60x60.png">
                               <link rel="apple-touch-icon" sizes="72x72" href="icons/apple-icon-72x72.png">
                               <link rel="apple-touch-icon" sizes="76x76" href="icons/apple-icon-76x76.png">
                               <link rel="apple-touch-icon" sizes="114x114" href="icons/apple-icon-114x114.png">
                               <link rel="apple-touch-icon" sizes="120x120" href="icons/apple-icon-120x120.png">
                               <link rel="apple-touch-icon" sizes="144x144" href="icons/apple-icon-144x144.png">
                               <link rel="apple-touch-icon" sizes="152x152" href="icons/apple-icon-152x152.png">
                               <link rel="apple-touch-icon" sizes="180x180" href="icons/apple-icon-180x180.png">
                               <link rel="icon" type="image/png" sizes="192x192"  href="icons/android-icon-192x192.png">
                               <link rel="icon" type="image/png" sizes="32x32" href="icons/favicon-32x32.png">
                               <link rel="icon" type="image/png" sizes="96x96" href="icons/favicon-96x96.png">
                               <link rel="icon" type="image/png" sizes="16x16" href="icons/favicon-16x16.png">
                               <link rel="manifest" href="icons/manifest.json">
                               <meta name="msapplication-TileColor" content="#ffffff">
                               <meta name="msapplication-TileImage" content="icons/ms-icon-144x144.png">
                               <meta name="theme-color" content="#ffffff">')),
                tabItems(
                  # Registration Tab
                  tabItem(tabName = "regis", 
                          
                          style = "overflow-y:visible;",
                          img(src='bbvab4.png', align = "rigth",width="1000px",height="100%"),
                         
                              textInput("user", label = h3("Usuario"), value = "Ingresa tu usuario M o MB"),
                              textInput("pass", label = h3("Contraseña"), value = "Ingresa tu contraseña"),
                              actionButton("activar1", "Activar")
                              ),
                  # Upload data Tab
                  tabItem(tabName = "datafile",
                          style = "overflow-y:visible;",

                              
                          fileInput('file1', "Elige tu archivo .csv",
                                        accept = c('csv')),
                      
                              uiOutput("products"),
                          
                              plotOutput("plot1")
                          ),
                          
                  # Population Stability Index Tab
                  tabItem(tabName = "psi",
                          style = "overflow-y:scroll;",
                          
                          box(width = 12, height = "200px",
                              dataTableOutput("table1")))

                  )
                  )
                  )

