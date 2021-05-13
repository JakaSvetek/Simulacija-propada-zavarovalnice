# funkcije

simulacija <- function(zacetni_kapital, stevilo_dni, verjetnost){
  S <- zacetni_kapital
  n <- stevilo_dni
  p <- verjetnost
  i <- 0
  dnevi <- runif(n, min = 0, max = 1)
  for (dan in dnevi) {
    i <- i + 1
    if (S < 0){
      break
    }
    else if (dan >= p){
      S <- S + 1
    }
    else {
      S <- S - 1
    }
  }
  if (S < 0){
    dan_pika <- gsub(" ", "", paste(i, "."))
    print(paste("Propad v dnevu", dan_pika))
  }
  else if (i == length(dnevi)){
    kapital_pika <- gsub(" ", "", paste(S, "."))
    print(paste("Kapital na zadnji dan je", kapital_pika)) 
  }
}



Vec_simulacij <- function(stevilo_simulacij, zacetni_kapital, stevilo_dni, verjetnost){
  T <- 1:stevilo_simulacij
  n <- stevilo_dni
  p <- verjetnost
  propadli <- 0
  for (t in T) {
    S <- zacetni_kapital
    i <- 0
    dnevi <- runif(n, min = 0, max = 1)
    for (dan in dnevi) {
      i <- i + 1
      if (S < 0){
        propadli <- propadli + 1
        break
      }
      else if (dan >= p){
        S <- S + 1
      }
      else {
        S <- S - 1
      }
    }
  }
  propadli
}



Vec_simulacij_rezultat <- function(stevilo_simulacij, zacetni_kapital, stevilo_dni, verjetnost){
  propadli <-Vec_simulacij(stevilo_simulacij, zacetni_kapital, stevilo_dni, verjetnost)
  propadli_pika <- gsub(" ", "", paste(propadli, "."))
  print(paste("Propadlo jih je", propadli_pika))
}


Graf_propada <- function(stevilo_dni, verjetnost){
  n <- stevilo_dni
  p <- verjetnost
  kapitali <- 1:(stevilo_dni * ( 4 / 10))
  vektor_propadlih <- c()
  for (kapital in kapitali){
    propadli <- Vec_simulacij(1000, kapital, stevilo_dni, verjetnost) / 10
    vektor_propadlih <- c(vektor_propadlih, propadli)
  }
  podatki <- data.frame(kapitali, vektor_propadlih)
  ggplot(podatki, 
         aes(x=kapitali, y=vektor_propadlih)) +
    geom_line() +
    ylim(0,100) +
    ylab("Propadli[%]") +
    xlab("Začetni kapital")
}





