from selenium import webdriver

# Specify the path to the ChromeDriver executable (download from https://sites.google.com/chromium.org/driver/)
chrome_driver_path = '/Users/monalisanayak/Documents/chromedriver_mac_arm64/chromedriver'

# Create a new instance of the Chrome WebDriver
driver = webdriver.Chrome(executable_path=chrome_driver_path)

# Open a website
website_url = 'https://todomvc.com/examples/react/dist/'
driver.get(website_url)

# Wait for a few seconds (you can use explicit or implicit waits for better synchronization)
driver.implicitly_wait(5)

# Close the browser window
driver.quit()
