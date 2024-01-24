from fastapi import FastAPI
from opentelemetry.instrumentation.fastapi import FastAPIInstrumentor
import uvicorn

app = FastAPI()

FastAPIInstrumentor().instrument_app(app)

@app.get("/")
async def read_root():
    return {"message": "Hello, Open!"}

@app.get("/buteco")
async def buteco():
    return {"message": "Bora tomar uma?"}

if __name__ == '__main__':
    uvicorn.run("main:app", host="0.0.0.0", port=8001)
