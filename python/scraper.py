from playwright_aws_lambda import chromium
from playwright.sync_api import sync_playwright
from bs4 import BeautifulSoup

def get_page_title(url: str) -> str:
    with sync_playwright() as p:
        browser = chromium.launch(headless=True)
        page = browser.new_page()
        page.goto(url, timeout=10000)
        html = page.content()
        browser.close()

    soup = BeautifulSoup(html, "html.parser")
    return soup.title.string if soup.title else "No title found"