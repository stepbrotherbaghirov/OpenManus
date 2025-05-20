from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "OpenManus is running"}
import os

if __name__ == "__main__":
    import uvicorn
    port = int(os.environ.get("PORT", 10000))
    uvicorn.run("server:app", host="0.0.0.0", port=port, reload=False)
