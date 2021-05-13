shinyUI(
  fluidPage(
    theme = shinytheme("yeti"),
    navbarPage("Simulacija",
               
               tabPanel("Ena zavarovalnica",
                        titlePanel(title = h2("Uspeh posamezne zavarovalnice")),
                        sidebarLayout(
                          
                          sidebarPanel(
                            
                            numericInput(
                              inputId = "zacetni_kapital",
                              label = "Začetni kapital",
                              value = 50
                            ),
                            
                            numericInput(
                              inputId = "stevilo_dni",
                              label = "Število dni",
                              value = 100
                            ),
                            
                            sliderInput(
                              inputId = "verjetnost",
                              label = "Verjetnost, da se zgodi nesreča",
                              min = 0,
                              max = 1,
                              value = 0.5
                            ),
                            
                            actionButton(
                              inputId = "osvezi1",
                              label = "osveži"
                            )
                          ),
                          
                          
                          mainPanel(
                            h2(textOutput(outputId = "uspeh_zavarovalnice"), align = "center")
                          )
                          
                        )),

               
               
               tabPanel("Več zavarovalnic",
                        titlePanel(title = h2("Uspeh več identičnih zavarovalnic")),
                        sidebarLayout(
                          
                          sidebarPanel(
                            
                            numericInput(
                              inputId = "stevilo_simulacij",
                              label = "Število zavarovalnic",
                              value = 100
                            ),
                            
                            numericInput(
                              inputId = "zacetni_kapital_vecih",
                              label = "Začetni kapital",
                              value = 50
                            ),
                            
                            numericInput(
                              inputId = "stevilo_dni_vecih",
                              label = "Število dni",
                              value = 100
                            ),
                            
                            sliderInput(
                              inputId = "verjetnost_vecih",
                              label = "Verjetnost, da se zgodi nesreča",
                              min = 0,
                              max = 1,
                              value = 0.5
                            ),
                            
                            actionButton(
                              inputId = "osvezi2",
                              label = "osveži"
                            )
                          ),
                          
                          mainPanel(
                            h2(textOutput(outputId = "vec_zavarovalnic"), align = "center")
                          )
                        )),
               
               
               
               tabPanel("Odvisnost od začetnega kapitala",
                        titlePanel(title = h2("Verjetnost propada z odvisnostjo od začetnega kapitala")),
                        sidebarLayout(
                          
                          sidebarPanel(
                            
                            numericInput(
                              inputId = "stevilo_dni_graf",
                              label = "Število dni",
                              value = 100
                            ),
                            
                            sliderInput(
                              inputId = "verjetnost_graf",
                              label = "Verjetnost, da se zgodi nesreča",
                              min = 0,
                              max = 1,
                              value = 0.5
                            )
                          ),
                          
                          mainPanel(
                            plotOutput(outputId = "graf_propada")
                          )
                        ))
               )
  )
)