import pytesseract
import asyncio

pytesseract.pytesseract.tesseract_cmd = r"C:/Users/mbite/AppData/Local/Programs/Tesseract-OCR/tesseract.exe"

async def read_image(img_path, lang='eng'):
    try:
        text = pytesseract.image_to_string(img_path, lang=lang)
        await asyncio.sleep(2)
        print(text)
        return text
    except:
        return "[ERROR] Unable to process file: {0}".format(img_path)
    
if __name__ == "__main__":
    path = r'C:\\Users\\mbite\\Desktop\\ocr\\bzez3lamok.png'
    text = asyncio.run(read_image(path))
    print(text)