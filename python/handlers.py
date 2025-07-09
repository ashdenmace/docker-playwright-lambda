from python.scraper import get_page_title

def handler(event, context):
    url = event.get("queryStringParameters", {}).get("url", "https://hazevw.com/")
    title = get_page_title(url)
    return {
        "statusCode": 200,
        "body": f"Page title from {url}: {title}"
    }