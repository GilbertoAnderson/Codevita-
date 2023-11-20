
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By

driver = webdriver.Chrome(executable_path="E:/Giba/Trabalho/drives/google/chromedriver_win32/chromedriver.exe")
driver.get("https://www.google.com.br/")
elem  = driver.find_element(By.NAME, "q")
elem.send_keys("Gilberto Anderson")
elem.send_keys(Keys.RETURN)
