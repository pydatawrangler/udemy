I purchased the course on 12/29/2022.

Example websites:
* https://subslikescript.com/

Recommended to find elements in this order:
1. ID
2. Class name
3. Tag name, CSS Selector
4. Xpath

Beautiful Soup Steps:
1. Fetch the pages with `result = requests.get("www.google.com")`
2. Page content with `content = result.text`
3. Create soup with `soup = BeautifulSoup(content, "lxml")`

Installing Selenium:
1. `pip install selenium==3.141.0`

Installing ChromeDriver
1. Check version of chrome by going to Help and then About Google Chrome.  My version is `108.0.5359.124 (Official Build) (arm64)`.
2. Download chromedriver from `https://chromedriver.chromium.org/downloads`.
3. If chromedriver will not open, follow these steps:
   * Go to the system and preferences -> security and privacy.
   * Then under general tab you will see a notification that about the exec you are trying to open.
   * Just click "open anyway" there.
   * Go back to the chromedriver exe and open it it will then give you the same error but along with that you will get an option to open it.
   * Click Open and it should resolve.
