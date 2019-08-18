require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome

Given(/^Navegamos a la URL Google.com.co$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  begin
	  driver.navigate.to "https://www.google.com.co"
  end
end

When(/^Ingresamos la palabra "(.*?)"$/) do |palabra_busqueda|
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  begin
    driver.find_element(:xpath, '//*[@name="q"]').send_keys(palabra_busqueda)
	  driver.find_element(:xpath, '//*[@id="hplogo"]').click
  end
end

And(/^Damos click en Buscar$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  begin
    driver.find_element(:xpath, '//*[@id="tsf"]/div/div/div/center/input[1]').click
  end
end

And(/^Damos click en la palabra sugerida$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  begin
    driver.find_element(:xpath, '//*[@id="fprsl"]/b/i').click
  end
end

Then(/^Aparece "(.*?)" o mas resultados de la busqueda$/) do |numero_resultados|
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  begin
    driver.find_elements(:xpath, '//*[@class="g"]').size.should > numero_resultados.to_i
  end
end