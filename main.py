from fastapi import FastAPI, Request, Form
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
import asyncio
from app.agent.manus import Manus
from app.logger import logger

app = FastAPI()
templates = Jinja2Templates(directory="templates")

@app.get("/", response_class=HTMLResponse)
async def get_form(request: Request):
    return templates.TemplateResponse("index.html", {"request": request})

@app.post("/", response_class=HTMLResponse)
async def handle_prompt(request: Request, prompt: str = Form(...)):
    if not prompt.strip():
        return templates.TemplateResponse("index.html", {"request": request, "result": "Empty prompt"})

    logger.warning("Processing your request...")
    agent = await Manus.create()
    result = await agent.run(prompt)
    await agent.cleanup()

    return templates.TemplateResponse("index.html", {"request": request, "result": result})
