shinyServer(function(input, output){
  
  output$uspeh_zavarovalnice <- eventReactive(input$osvezi1, {
    print(simulacija(
      input$zacetni_kapital,
      input$stevilo_dni,
      input$verjetnost
    ))
  })

  
  output$vec_zavarovalnic <- eventReactive(input$osvezi2, {
    print(Vec_simulacij_rezultat(
      input$stevilo_simulacij,
      input$zacetni_kapital_vecih,
      input$stevilo_dni_vecih,
      input$verjetnost_vecih
    ))
  })
  

  output$graf_propada <- renderPlot(
    print(
      Graf_propada(
        input$stevilo_dni_graf,
        input$verjetnost_graf
      )
    )
  )

})
