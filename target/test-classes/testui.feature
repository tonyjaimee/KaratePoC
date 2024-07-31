Feature: browser automation 1

Background:
  * configure driver = { type: 'chrome',port: 9222, headless: true, addOptions: [ '--headless=new' ], executable: "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"}
# * configure driver = { type: 'chrome', showDriverLog: true }
# * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
# * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
# * configure driver = { type: 'chromedriver', showDriverLog: true }
# * configure driver = { type: 'geckodriver', showDriverLog: true }
# * configure driver = { type: 'safaridriver', showDriverLog: true }
# * configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

@GithubLogin
Scenario: try to login to github with random user name and password

  Given driver 'https://github.com/login'
  And input('#login_field', 'dummy')
  And input('#password', 'world')
  When submit().click("input[name=commit]")
  Then match html('.flash-error') contains 'Incorrect username or password.'

@GoogleSearch
Scenario: do a google search
  Given driver 'https://google.com'
  And input("textarea[name=q]", 'karate dsl')
  When submit().click("input[name=btnI]")
  Then waitForUrl('https://github.com/karatelabs/karate')