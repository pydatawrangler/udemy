Purchased the course on 12/29/2022.

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
