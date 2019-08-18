Feature: 
Para buscar en Google una palabra
Como Usuario
Quiero comprobar el numero de resultados de busqueda
Scenario: Positivo
  Given Navegamos a la URL Google.com.co
  When Ingresamos la palabra "pruebaz"
  And Damos click en Buscar
  And Damos click en la palabra sugerida
  Then Aparece "6" o mas resultados de la busqueda
  
Scenario: Negativo : 50 Resultados
  Given Navegamos a la URL Google.com.co
  When Ingresamos la palabra "pruebaz"
  And Damos click en Buscar
  And Damos click en la palabra sugerida
  Then Aparece "50" o mas resultados de la busqueda
  
Scenario: Negativo : Palabra no existe
  Given Navegamos a la URL Google.com.co
  When Ingresamos la palabra "2345654263455426345"
  And Damos click en Buscar
  And Damos click en la palabra sugerida
  Then Aparece "6" o mas resultados de la busqueda